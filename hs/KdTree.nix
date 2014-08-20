{ cabal, QuickCheck }:

cabal.mkDerivation (self: {
  pname = "KdTree";
  version = "0.2.1";
  sha256 = "1vj1kbhyqh0xzwyr9v6fdyakx508vbf6n494z81yndisp115qi61";
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ QuickCheck ];
  meta = {
    homepage = "https://github.com/ijt/kdtree";
    description = "KdTree, for efficient search in K-dimensional point clouds";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
