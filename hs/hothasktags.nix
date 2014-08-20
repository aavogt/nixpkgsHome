{ cabal, cmdargs, cpphs, filepath, haskellSrcExts }:

cabal.mkDerivation (self: {
  pname = "hothasktags";
  version = "0.3.2";
  sha256 = "12gq3ni7w75wcvahx3yzpmgw8zl7bamswipfzr9a97j5hmi2h766";
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ cmdargs cpphs filepath haskellSrcExts ];
  meta = {
    homepage = "http://github.com/luqui/hothasktags";
    description = "Generates ctags for Haskell, incorporating import lists and qualified imports";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
