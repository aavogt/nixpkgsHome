{ cabal, deepseq, hashable, HUnit, primes, QuickCheck
, testFramework, testFrameworkHunit, testFrameworkQuickcheck2
, testFrameworkTh, typeLevelNumbers
}:

cabal.mkDerivation (self: {
  pname = "finite-field";
  version = "0.8.0";
  sha256 = "0wlbq7dpb4545xdnqjqppp0cmjx9m8g1p6lydkvn7pj7dwar8lni";
  buildDepends = [ deepseq hashable typeLevelNumbers ];
  testDepends = [
    HUnit primes QuickCheck testFramework testFrameworkHunit
    testFrameworkQuickcheck2 testFrameworkTh typeLevelNumbers
  ];
  meta = {
    description = "Finite Fields";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
