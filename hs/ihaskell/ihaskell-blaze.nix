{ cabal, blazeHtml, blazeMarkup, classyPrelude, ihaskell, src }:

cabal.mkDerivation (self: {
  inherit src;
  pname = "ihaskell-blaze";
  version = "0.1.0.0";
  sha256 = "";
  buildDepends = [ blazeHtml blazeMarkup classyPrelude ihaskell ];
  meta = {
    homepage = "http://www.github.com/gibiansky/ihaskell";
    description = "IHaskell display instances for blaze-html types";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
