{ cabal, aeson, classyPrelude, here, ihaskell, parsec, random
, unorderedContainers, src
}:

cabal.mkDerivation (self: {
  inherit src;
  pname = "ihaskell-parsec";
  version = "0.1.0.0";
  sha256 = "";
  jailbreak = true;
  buildDepends = [
    aeson classyPrelude here ihaskell parsec random unorderedContainers
  ];
  meta = {
    homepage = "http://www.github.com/gibiansky/ihaskell";
    description = "IHaskell display instances for Parsec";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
