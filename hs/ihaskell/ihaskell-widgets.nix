{ cabal, aeson, classyPrelude, here, ihaskell, src }:

cabal.mkDerivation (self: {
  inherit src;
  pname = "ihaskell-widgets";
  version = "0.1.0.0";
  sha256 = "";
  jailbreak = true;
  buildDepends = [ aeson classyPrelude here ihaskell ];
  meta = {
    homepage = "http://www.github.com/gibiansky/ihaskell";
    description = "IHaskell display instances for displayable widgets";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
