{ cabal, dataInterval, deepseq, exceptions, filepath, finiteField
, hashable, heaps, HUnit, intern, lattices, mtl, multiset, OptDir
, parsec, parseDimacs, prettyclass, primes, queue, QuickCheck
, random, sign, stm, temporary, testFramework, testFrameworkHunit
, testFrameworkQuickcheck2, testFrameworkTh, time, typeLevelNumbers
, unboundedDelays, unorderedContainers, vectorSpace
, fetchgit
}:

cabal.mkDerivation (self: {
  doCheck = false;
  pname = "toysolver";
  version = "0.0.7";
  src = fetchgit {
    url = git://github.com/msakai/toysolver.git;
    rev = "a8936d507b07026f6e0bca23fc40f11dc9cf0b57";
    sha256 = "be2ab8db507b1858f97ed0c5deb580f44adee20401628232772f1e77fa428803";
  };
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    dataInterval deepseq exceptions filepath finiteField hashable heaps
    intern lattices mtl multiset OptDir parsec parseDimacs prettyclass
    primes queue random sign stm temporary time typeLevelNumbers
    unboundedDelays unorderedContainers vectorSpace
  ];
  testDepends = [
    dataInterval finiteField HUnit OptDir prettyclass QuickCheck stm
    testFramework testFrameworkHunit testFrameworkQuickcheck2
    testFrameworkTh vectorSpace
  ];
  meta = {
    description = "Assorted decision procedures for SAT, Max-SAT, PB, MIP, etc";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
