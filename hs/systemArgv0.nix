{ cabal, systemFilepath, text }:

cabal.mkDerivation (self: {
  pname = "system-argv0";
  version = "0.1.1";
  sha256 = "1ijfry2r3cypp3zmws6dczk21m4n86fkxjld7yl19gjp46fxllbd";
  buildDepends = [ systemFilepath text ];
  meta = {
    homepage = "https://john-millikin.com/software/haskell-filesystem/";
    description = "Get argv[0] as a FilePath";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
