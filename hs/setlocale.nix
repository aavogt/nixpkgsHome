{ cabal, fetchurl }:

cabal.mkDerivation (self: {
  pname = "setlocale";
  version = "0.0.4";
  src = fetchurl {
      url = http://code.haskell.org/~aavogt/setlocale-0.0.4.tar.gz ;
      sha256 = "ebfbadb79cd3fb62067c9f10461b05353ac8da0c9aeba51148ca5099fcb9a953";
  };
  meta = {
    description = "A Haskell interface to setlocale()";
    license = self.stdenv.lib.licenses.publicDomain;
    platforms = self.ghc.meta.platforms;
  };
})
