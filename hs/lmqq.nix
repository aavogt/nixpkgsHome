{ cabal, cassava, HList, hmatrix, hmatrixLabeled, lens, mtl
, randomFu, RlangQQ, uuParsinglib, vector, fetchdarcs
}:

cabal.mkDerivation (self: {
  pname = "lmqq";
  version = "0.1";
  src = fetchdarcs {
    url = "http://code.haskell.org/~aavogt/lmqq";
  };
  buildDepends = [
    cassava HList hmatrix hmatrixLabeled lens mtl randomFu RlangQQ
    uuParsinglib vector
  ];
  meta = {
    description = "quasiquote/embedded language for linear models";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
