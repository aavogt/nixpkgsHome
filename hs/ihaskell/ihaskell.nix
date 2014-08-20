{ cabal, pythonPackages, haskellPackages, src }:
cabal.mkDerivation (self: {
  inherit src;
  pname = "ihaskell";
  version = "0.4.1.0";
  isLibrary = true;
  isExecutable = true;
  propagatedUserEnvPkgs = [ pythonPackages.ipython ] ++ self.buildDepends;
  doCheck = false;
  buildDepends = with haskellPackages;
    [aeson base64Bytestring cereal classyPrelude cmdargs
     filepath ghcParser ghcPaths haskeline haskellSrcExts here
     hlint hspec HTTP HUnit MissingH monoTraversable mtl parsec
     random setenv shelly split stm strict systemArgv0
     systemFilepath tar text transformers unorderedContainers
     utf8String uuid vector zeromq4Haskell];
  testDepends = self.buildDepends;
  meta = {
    homepage = "http://gibiansky.github.io/IHaskell/";
    description = "A Haskell backend kernel for the IPython project";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
