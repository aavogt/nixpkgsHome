{ cabal }:

cabal.mkDerivation (self: {
  pname = "lattices";
  version = "1.2.1.1";
  sha256 = "0ppqvc3w7v56zya43b3fqwis50c8b57hlighzmk8jphv39y3ilp6";
  meta = {
    description = "Fine-grained library for constructing and manipulating lattices";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
