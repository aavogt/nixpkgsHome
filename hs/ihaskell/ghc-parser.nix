{ cabal, src }:

cabal.mkDerivation (self: {
  inherit src;
  pname = "ghc-parser";
  version = "0.1.2.0";
  meta = {
    homepage = "https://github.com/gibiansky/IHaskell";
    description = "Haskell source parser from GHC";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
