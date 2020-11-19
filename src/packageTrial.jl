module packageTrial

# export functions you want to call without qualifications
export add_exported
export my_f

#using DataFrames # or any other module

# Include functions
include("extra_file.jl")

end # module
