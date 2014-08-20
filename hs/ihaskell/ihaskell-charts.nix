{ cabal, Chart, ChartCairo, classyPrelude, dataDefaultClass
, ihaskell, src
}:

cabal.mkDerivation (self: {
  inherit src;
  pname = "ihaskell-charts";
  version = "0.1.0.0";
  sha256 = "";
  buildDepends = [
    Chart ChartCairo classyPrelude dataDefaultClass ihaskell
  ];
  meta = {
    homepage = "http://www.github.com/gibiansky/ihaskell";
    description = "IHaskell display instances for charts types";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
