{ cabal, base64Bytestring, blazeHtml, filepath, ihaskell
, ihaskellBlaze, RlangQQ, split, stm, xformat, src
}:

cabal.mkDerivation (self: {
  inherit src;
  pname = "ihaskell-rlangqq";
  version = "0.1.0.0";
  sha256 = "";
  buildDepends = [
    base64Bytestring blazeHtml filepath ihaskell ihaskellBlaze RlangQQ
    split stm xformat
  ];
  meta = {
    description = "a rDisp quasiquote to show plots from Rlang-QQ in IHaskell";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
