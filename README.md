# GMP

This micro-package provides access to the gmp library, in a manner suitable to C dependencies.

The package should be built (once) using `Pkg.build("GMP")', and invoked with 'using GMP'.

GMP is installed at the prefix GMP.prefix. The library files are available at GMP.lib, and the header file at GMP.include.

Typical usage is to pass "--with-gmp=$(GMP.prefix)" to configure scripts.

![Build Status](https://travis-ci.org/laurentbartholdi/GMP.jl.svg?branch=master)](https://travis-ci.org/laurentbartholdi/GMP.jl)
