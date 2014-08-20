{ cabal, haskellSrcMeta, ... }:

cabal.mkDerivation (self: {
  pname = "applicative-quoters";
  version = "0.1.0.8";
  sha256 = "10m29d0938khjdazsmsvvncr5xndnpzpm1b7ymzb3b4b81xmcpgl";
  buildDepends = [ haskellSrcMeta ];
  meta = {
    description = "Quasiquoters for idiom brackets and an applicative do-notation";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
