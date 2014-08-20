{ cabal, deepseq, hashable, HUnit, lattices, QuickCheck
, testFramework, testFrameworkHunit, testFrameworkQuickcheck2
, testFrameworkTh
}:

cabal.mkDerivation (self: {
  pname = "data-interval";
  version = "0.4.0";
  sha256 = "0kbpysbrlkkj7z8v5gfzyjw91xl7m7b4jw8f5sq7nqzpx6spwbgg";
  buildDepends = [ deepseq hashable lattices ];
  testDepends = [
    HUnit QuickCheck testFramework testFrameworkHunit
    testFrameworkQuickcheck2 testFrameworkTh
  ];
  meta = {
    description = "Interval arithmetic for both open and closed intervals";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
