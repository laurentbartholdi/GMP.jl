module GMP

if isfile(joinpath(Pkg.dir(string(current_module())),"deps","path.jl"))
    include("../deps/path.jl")
else
    error("GMP not properly installed. Please run Pkg.build(\"GMP\")")
end

include = joinpath(dir,"include")
lib = joinpath(dir,"lib")

end # module
