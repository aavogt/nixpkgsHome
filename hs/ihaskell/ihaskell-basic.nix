{ cabal, classyPrelude, ihaskell, src }:

cabal.mkDerivation (self: {
  inherit src;
  pname = "ihaskell-basic";
  version = "0.1.0.0";
  sha256 = "";
  buildDepends = [ classyPrelude ihaskell ];
  meta = {
    homepage = "http://www.github.com/gibiansky/IHaskell";
    description = "IHaskell display instances for basic types";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
