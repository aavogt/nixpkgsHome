{ cabal, Cabal, filepath, optparseApplicative }:

cabal.mkDerivation (self: {
  pname = "standalone-haddock";
  version = "1.1.4.2";
  sha256 = "109gz6kwqbwj7m59xj59adzkg5kahbd2j1vs92mv8jp71slj887n";
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ Cabal filepath optparseApplicative ];
  meta = {
    homepage = "http://documentup.com/feuerbach/standalone-haddock";
    description = "Generate standalone haddock documentation for a set of packages";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
