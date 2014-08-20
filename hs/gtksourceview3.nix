{ cabal, gnome3, haskellPackages }:

cabal.mkDerivation (self: {
  pname = "gtksourceview3";
  version = "0.13.0.0";
  sha256 = "1l39gqxyv1hxlx021ac4ah02lb7bvl8q6b6rkqwwgp1kk47gqkqv";
  buildDepends = with haskellPackages;
    [ glib gtk3 mtl text ];
  buildTools = [ haskellPackages.gtk2hsBuildtools ];
  pkgconfigDepends = with gnome3;
      [ gtksourceview gtk ];
  meta = {
    homepage = "http://projects.haskell.org/gtk2hs/";
    description = "Binding to the GtkSourceView library";
    license = self.stdenv.lib.licenses.lgpl21;
    platforms = self.ghc.meta.platforms;
  };
})
