{ cabal, hashable, text, unorderedContainers }:

cabal.mkDerivation (self: {
  pname = "intern";
  version = "0.9.1.3";
  sha256 = "1629m3an18m3nqxq40mg9cn0c6rma1wm3jr7kn6kqpw4xq53zvvp";
  buildDepends = [ hashable text unorderedContainers ];
  meta = {
    homepage = "http://github.com/ekmett/intern/";
    description = "Efficient hash-consing for arbitrary data types";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
