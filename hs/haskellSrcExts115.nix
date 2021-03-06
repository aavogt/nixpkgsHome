{ cabal, cpphs, filemanip, filepath, happy, mtl, smallcheck, syb
, tasty, tastyGolden, tastySmallcheck
}:

cabal.mkDerivation (self: {
  pname = "haskell-src-exts";
  version = "1.15.0.1";
  sha256 = "0xp5i06c478vn5m504ax5dfa7p5zc0kflbdkm2ijdzc779lpbx45";
  buildDepends = [ cpphs ];
  testDepends = [
    filemanip filepath mtl smallcheck syb tasty tastyGolden
    tastySmallcheck
  ];
  buildTools = [ happy ];
  meta = {
    homepage = "https://github.com/haskell-suite/haskell-src-exts";
    description = "Manipulating Haskell source: abstract syntax, lexer, parser, and pretty-printer";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
