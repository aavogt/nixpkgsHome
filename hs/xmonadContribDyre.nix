{ cabal, extensibleExceptions, mtl, random, utf8String, X11, X11Xft
, xmonadDyre, fetchdarcs, ...
}:

cabal.mkDerivation (self: {
  pname = "xmonad-contrib";
  version = "0.12";
  src = fetchdarcs {
      url = /home/aavogt/wip/x11-wm/xmonad/contrib/dyre ;
      sha256 = "";
  };
  buildDepends = [
    extensibleExceptions mtl random utf8String X11 X11Xft xmonadDyre
  ];
  meta = {
    homepage = "http://xmonad.org/";
    description = "Third party extensions for xmonad";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
