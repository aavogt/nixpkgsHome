{ cabal, HaTeX, ihaskell, text, src }:

cabal.mkDerivation (self: {
  inherit src;
  pname = "ihaskell-hatex";
  version = "0.1.0.0";
  sha256 = "";
  buildDepends = [ HaTeX ihaskell text ];
  meta = {
    homepage = "http://www.github.com/gibiansky/IHaskell";
    description = "IHaskell display instances for hatex";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
