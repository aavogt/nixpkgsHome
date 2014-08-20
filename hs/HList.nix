{ cabal, cmdargs, doctest, filepath, hspec, lens, mtl,
  profunctors, QuickCheck, syb, tagged, fetchdarcs, ... }:

cabal.mkDerivation (self: {
  pname = "HList";
  version = "0.4.0.0";
  src = fetchdarcs {
      url = http://code.haskell.org/HList ;
      sha256 = "";
  };
  buildDepends = [ mtl profunctors tagged ];
  testDepends = [
    cmdargs doctest filepath hspec lens mtl QuickCheck syb
  ];
  doCheck = false;
  meta = {
    description = "Heterogeneous lists";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
