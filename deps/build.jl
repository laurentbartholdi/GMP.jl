using BinDeps

@BinDeps.setup

# make sure the system one is not taken, it maybe doesn't have the header files
libgmp = library_dependency("dummy_libgmp")

GMP_VERSION = "6.1.0"

if false # these are binary-only distributions
@windows_only begin
    using WinRPM
    provides(WinRPM.RPM, "libgmp", libgmp, os = :Windows)
end
provides(AptGet, "libgmp-dev", libgmp)

provides(Yum, "gmp", libgmp)

provides(Pacman, "gmp", libgmp)
end

@osx ? begin
    using Homebrew
    provides(Homebrew.HB, "gmp", libgmp, os = :Darwin)
    dir = Homebrew.prefix()
end : begin
    provides(Sources, URI("https://gmplib.org/download/gmp/gmp-"*GMP_VERSION*".tar.bz2"), libgmp)
    provides(BuildProcess, Autotools(libtarget = ".libs/libgmp.la"), libgmp)
    dir = joinpath(Pkg.dir(string(current_module())),"deps","usr")
end

try
    @BinDeps.install Dict(:libgmp => :libgmp)
catch LoadError
end

pathfile = open(joinpath(splitdir(Base.source_path())[1],"path.jl"), "w")
println(pathfile,"# automatically generated")
println(pathfile,"dir = \"$dir\"")
close(pathfile)
