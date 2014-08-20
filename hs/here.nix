{ cabal, haskellSrcMeta, mtl, parsec }:

cabal.mkDerivation (self: {
  pname = "here";
  version = "1.2.4";
  sha256 = "1wjzpywlrfinqy4m758f2kn517h85bkaiylfbdj9azwqjyihjwy6";
  buildDepends = [ haskellSrcMeta mtl parsec ];
  meta = {
    homepage = "https://github.com/tmhedberg/here";
    description = "Here docs & interpolated strings via quasiquotation";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
