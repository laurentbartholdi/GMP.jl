module GMP

if isfile(joinpath(Pkg.dir(string(current_module())),"deps","path.jl"))
    include("../deps/path.jl")
else
    error("GMP not properly installed. Please run Pkg.build(\"GMP\")")
end

include = joinpath(prefix,"include")
lib = joinpath(prefix,"lib")

end # module
