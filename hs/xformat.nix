{ cabal }:

cabal.mkDerivation (self: {
  pname = "xformat";
  version = "0.1.2.1";
  sha256 = "1q2wm0wffvppbv5rd16z367yfkx2sq7j0i5dkfwpawf859c9pz7x";
  meta = {
    homepage = "http://github.com/spl/xformat";
    description = "Extensible, type-safe formatting with scanf- and printf-like functions";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
