{ cabal, base64Bytestring, classyPrelude, ihaskell, haskell_magic, text
, utf8String, src
}:

cabal.mkDerivation (self: {
  inherit src;
  pname = "ihaskell-magic";
  version = "0.1.0.0";
  sha256 = "";
  buildDepends = [
    base64Bytestring classyPrelude ihaskell haskell_magic text utf8String
  ];
  meta = {
    homepage = "http://www.github.com/gibiansky/IHaskell";
    description = "IHaskell display instances for bytestrings";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
