{ cabal, stdenv, fetchdarcs, dataDefault, dyre, extensibleExceptions, filepath, mtl, setlocale, utf8String, X11, QuickCheck}:

cabal.mkDerivation (self: {
  pname = "xmonad";
  version = "0.12";
  src = fetchdarcs {
      url = /home/aavogt/wip/x11-wm/xmonad/core/dyre;
      sha256 = "";
  };
  doCheck = false;
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    dataDefault dyre extensibleExceptions filepath mtl setlocale
    utf8String X11
  ];
  testDepends = 
    [ extensibleExceptions QuickCheck X11 ];
  postInstall = ''
    shopt -s globstar
    mkdir -p $out/share/man/man1
    mv "$out/"**"/man/"*.1 $out/share/man/man1/
  '';
  meta = {
    homepage = "http://xmonad.org";
    description = "A tiling window manager";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
