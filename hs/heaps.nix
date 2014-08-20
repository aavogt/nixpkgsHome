{ cabal, doctest, filepath }:

cabal.mkDerivation (self: {
  pname = "heaps";
  version = "0.3.1";
  sha256 = "1h0p097zc1wjinhdhy4ssav7jpicc85074d926nmnhdgz9vaajwj";
  testDepends = [ doctest filepath ];
  meta = {
    homepage = "http://github.com/ekmett/heaps/";
    description = "Asymptotically optimal Brodal/Okasaki heaps";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
