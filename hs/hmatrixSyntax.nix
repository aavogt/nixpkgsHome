{ cabal, haskellSrcExts, haskellSrcMeta, hmatrix, hspec, QuickCheck,
  fetchgit
}:

cabal.mkDerivation (self: {
  pname = "hmatrix-syntax";
  version = "0.1.2.1";
  src = fetchgit {
      url = https://github.com/aavogt/hmatrix-syntax ;
      rev = "10b9734519172267c2cc057c22708d5ab2deda4e" ;
      sha256 = "0345ff29fe3d3e5b9fb7f77fc309817598874682d4d87102c0aaf6499eb254ad";
  };
  buildDepends = [ haskellSrcExts haskellSrcMeta hmatrix hspec QuickCheck ];
  testDepends = [ hspec QuickCheck ];
  meta = {
    homepage = "http://github.com/reinerp/hmatrix-syntax";
    description = "MATLAB-like syntax for hmatrix vectors and matrices";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
