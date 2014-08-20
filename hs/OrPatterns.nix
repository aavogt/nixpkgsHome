{ cabal, haskellSrcExts, haskellSrcMeta, mtl, split, syb }:

cabal.mkDerivation (self: {
  pname = "OrPatterns";
  version = "0.1";
  sha256 = "0fkg2bnk7gh8lzf8i0bffj6qbbpq15sf8yw88rqpzghsz7xrr111";
  buildDepends = [ haskellSrcExts haskellSrcMeta mtl split syb ];
  meta = {
    description = "A quasiquoter for or-patterns";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
