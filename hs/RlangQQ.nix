{ cabal, binary, Cabal, doctest, filepath, haskellSrcMeta, HList
, mtl, repa, split, syb, temporary, text, transformers, trifecta
, utf8String, vector, zlib, fetchdarcs, ...
}:

cabal.mkDerivation (self: {
  pname = "Rlang-QQ";
  version = "0.2.1.0";
  /* src = /home/aavogt/wip/Rlang-QQ/dist/Rlang-QQ-0.2.1.0.tar.gz; */
  src = fetchdarcs {
    url = http://code.haskell.org/~aavogt/Rlang-QQ ;
    sha256 = ""; };
  buildDepends = [
    binary Cabal filepath haskellSrcMeta HList mtl repa split syb
    temporary text transformers trifecta utf8String vector zlib
  ];
  doCheck = false;
  testDepends = [ doctest ];
  meta = {
    homepage = "http://code.haskell.org/~aavogt/Rlang-QQ";
    description = "quasiquoter for inline-R code";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
