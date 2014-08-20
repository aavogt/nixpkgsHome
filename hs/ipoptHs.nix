{ cabal, ad, ansiWlPprint, c2hs,
  lens, mtl, uuParsinglib, vector, vectorSpace,

  ipopt, nlopt, liblapack, blas, pkgconfig
}:

cabal.mkDerivation (self: {
  pname = "ipopt-hs";
  version = "0.4.2.0";
  src = "/home/aavogt/wip/ipopt-hs/dist/ipopt-hs-0.4.2.0.tar.gz";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [
    ad ansiWlPprint lens mtl uuParsinglib vector vectorSpace
  ];
  buildTools = [ c2hs pkgconfig ];
  extraLibraries = [ ipopt nlopt liblapack blas ];
  pkgconfigDepends = [ ipopt nlopt ];
  meta = {
    description = "haskell binding to ipopt and nlopt including automatic differentiation";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
