{ cabal }:

cabal.mkDerivation (self: {
  pname = "type-level-numbers";
  version = "0.1.1.1";
  sha256 = "12iiyaqi60fpds7fv1qvphy84rwyj71maq54mfwpcr0bdrgyymjv";
  meta = {
    description = "Type level numbers implemented using type families";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
