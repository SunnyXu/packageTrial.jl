using packageTrial
using Documenter

makedocs(;
    modules=[packageTrial],
    authors="Jin Xu",
    repo="https://github.com/sunnyXu/packageTrial.jl/blob/{commit}{path}#L{line}",
    sitename="packageTrial.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://sunnyXu.github.io/packageTrial.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/sunnyXu/packageTrial.jl",
)
