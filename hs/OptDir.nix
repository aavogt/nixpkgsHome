{ cabal, hashable, syb }:

cabal.mkDerivation (self: {
  pname = "OptDir";
  version = "0.0.3";
  sha256 = "1bb5s57d3wyr9rd275jl0sk85yisl1dpbz042yg7pksv5l0xal0q";
  buildDepends = [ hashable syb ];
  meta = {
    description = "The OptDir type for representing optimization directions";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
