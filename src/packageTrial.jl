module packageTrial

__precompile__(false)

using Libdl


current_dir = @__DIR__
rr_api = joinpath(current_dir, "roadrunner_c_api.dll")
antimony_api = joinpath(current_dir, "libantimony.dll")
rrlib = Ptr{Nothing}
antlib = Ptr{Nothing}

include("rrc_utilities_binding.jl")
include("antimony_binding.jl")
include("rrc_types.jl")

# export functions you want to call without qualifications
export add_exported
export my_f

#using DataFrames # or any other module

# Include functions
include("extra_file.jl")



function __init__()
    @static if Sys.iswindows()
        global rrlib = Libdl.dlopen(rr_api)
        global antlib = Libdl.dlopen(antimony_api)
    else
        @warn "The current version of RoadRunner.jl only supports the platform of Windows x64."
    end
end


"""
    loada(antString::String)
Take an antimony string and return a roadrunner instance
"""
function loada(antString::String)
  rr = createRRInstance()
  try
    loadAntimonyString(antString)
    numModules = getNumModules()
    moduleName = getNthModuleName(numModules - 1)
    sbmlModel = getSBMLString(moduleName)
    loadSBML(rr, sbmlModel)
  finally
    freeAll()
    clearPreviousLoads()
  end
  return rr
end

"""
    createRRInstance()
Initialize  and return a new roadRunner instances.
"""
function createRRInstance()
  val = ccall(dlsym(rrlib, :createRRInstance), cdecl, Ptr{Nothing}, ())
  if val == C_NULL
    error("Failed to start up roadRunner")
  end
  return val
end



end # module
