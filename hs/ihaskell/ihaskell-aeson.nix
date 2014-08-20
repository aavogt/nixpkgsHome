{ cabal, aeson, aesonPretty, chunkedData, classyPrelude, here
, ihaskell, src
}:

cabal.mkDerivation (self: {
  inherit src;
  pname = "ihaskell-aeson";
  version = "0.1.0.0";
  sha256 = "";
  buildDepends = [
    aeson aesonPretty chunkedData classyPrelude here ihaskell
  ];
  meta = {
    homepage = "http://www.github.com/gibiansky/ihaskell";
    description = "IHaskell display instances for Aeson";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
