{ cabal, opencv, singletons, tagged, vector, vectorSpace,
  fetchgit, ... }:

cabal.mkDerivation (self: {
  pname = "HOpenCV";
  version = "0.4.0";
  src = /home/aavogt/wip/opencv/HOpenCV/dist/HOpenCV-0.4.0.tar.gz;
  /*
  src = fetchgit {
    url = http://github.com/aavogt/HOpenCV ;
    sha256 = "0p6y53d4yhxdd2yh2yvh72647vqidmdajh26kmxv3wflyd4n1ccm";
    rev = "2eeaa3f0f62ede34c28a96943ca991f3ecd02791";
  };
  */
  buildDepends = [ singletons tagged vector vectorSpace ];
  extraLibraries = [ opencv ];
  meta = {
    description = "A binding for the OpenCV computer vision library";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
