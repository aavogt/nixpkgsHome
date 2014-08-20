{ cabal, parsec }:

cabal.mkDerivation (self: {
  pname = "parse-dimacs";
  version = "1.3";
  sha256 = "0amh3h49xi65kx8l34cy5jkai1f0d9l1qxp4937f3cjf7afif0pj";
  buildDepends = [ parsec ];
  meta = {
    description = "DIMACS CNF parser library";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
