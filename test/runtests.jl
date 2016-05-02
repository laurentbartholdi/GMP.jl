using GMP
using Base.Test

@test isfile(joinpath(GMP.include,"gmp.h"))
