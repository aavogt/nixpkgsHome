{ cabal, file }:

cabal.mkDerivation (self: {
  pname = "magic";
  version = "1.0.8";
  sha256 = "0z4l9xk27k7jw1jhzmacrb0ny2iz0h9n2z30xvczfpyjwpgi35q2";
  extraLibraries = [ file ];
  meta = {
    description = "Interface to C file/magic library";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
