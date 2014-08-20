{ cabal, mtl, unorderedContainers, fetchgit }:

cabal.mkDerivation (self: {
  pname = "CTRex";
  version = "0.5";
  src = fetchgit {
    url = git://github.com/aavogt/CTRex ;
    rev = "2437d0d4583b02b758b919f35690f28eaeda164d" ;
    sha256 = "302c940500f06f17dab8cf166f425e6d69a9a3429548295b9da9fe7d5ef1a243";
  };
  buildDepends = [ mtl unorderedContainers ];
  meta = {
    homepage = "http://www.haskell.org/haskellwiki/CTRex";
    description = "Open records using closed type families";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
