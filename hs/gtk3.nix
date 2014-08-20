{ cabal, gnome3, gtk2hsBuildtools, haskellPackages }:

cabal.mkDerivation (self: {
  pname = "gtk3";
  version = "0.13.0.0";
  sha256 = "0aq58gf6bcwnk085in0xilg7p8zyd2v079aqk1c47gjyrcg7p78f";
  isLibrary = true;
  isExecutable = true;
  buildDepends = with haskellPackages;
      [ cairo gio glib mtl pango time transformers ];
  buildTools = [ gtk2hsBuildtools ];
  pkgconfigDepends = with gnome3;
      [ glib gtk ];
  meta = {
    homepage = "http://projects.haskell.org/gtk2hs/";
    description = "Binding to the Gtk+ graphical user interface library";
    license = self.stdenv.lib.licenses.lgpl21;
    platforms = self.ghc.meta.platforms;
  };
})
