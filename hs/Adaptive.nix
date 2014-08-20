{ cabal }:

cabal.mkDerivation (self: {
  pname = "Adaptive";
  version = "0.23";
  sha256 = "0n27d8dvk0qq68zp4l5bsj5y9xqmrk9d25psrrf29mmw1f43wp8c";
  isLibrary = true;
  isExecutable = true;
  meta = {
    description = "Library for incremental computing";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
