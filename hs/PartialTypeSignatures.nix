{ cabal, syb }:

cabal.mkDerivation (self: {
  pname = "PartialTypeSignatures";
  version = "0.1.0.1";
  sha256 = "04c01bcfrb79av2j9bivlwanmycasn7gjnc9gb5jm6gkwyvgv0h3";
  buildDepends = [ syb ];
  meta = {
    homepage = "http://code.haskell.org/~aavogt/PartialTypeSignatures";
    description = "emulate partial type signatures with template haskell";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
