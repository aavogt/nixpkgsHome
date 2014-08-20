{ cabal, classyPrelude, ihaskell, JuicyPixels, src }:

cabal.mkDerivation (self: {
  inherit src;
  pname = "ihaskell-juicypixels";
  version = "0.1.0.0";
  sha256 = "";
  buildDepends = [ classyPrelude ihaskell JuicyPixels ];
  meta = {
    homepage = "http://www.github.com/gibiansky/ihaskell";
    description = "IHaskell - IHaskellDisplay instances of the image types of the JuicyPixels package";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
