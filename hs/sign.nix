{ cabal, deepseq, hashable, HUnit, lattices, QuickCheck
, testFramework, testFrameworkHunit, testFrameworkQuickcheck2
, testFrameworkTh
}:

cabal.mkDerivation (self: {
  pname = "sign";
  version = "0.4.0";
  sha256 = "13if43014vyfl7bj1nicv6chjd01xyajsa2a71v71nq24lxjb7vx";
  buildDepends = [ deepseq hashable lattices ];
  testDepends = [
    HUnit QuickCheck testFramework testFrameworkHunit
    testFrameworkQuickcheck2 testFrameworkTh
  ];
  meta = {
    description = "Arithmetic over signs and sets of signs";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
