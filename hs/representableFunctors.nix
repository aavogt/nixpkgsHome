{ cabal, comonad, comonadsFd, comonadTransformers, contravariant
, distributive, free, keys, mtl, semigroupoids, semigroups
, transformers
}:

cabal.mkDerivation (self: {
  jailbreak = true;
  pname = "representable-functors";
  version = "3.2.0.2";
  sha256 = "156rhm9hqxkwpv4ppg6647gz2q95mp61rx6ii0nk6i0ygmjvw1l2";
  buildDepends = [
    comonad comonadsFd comonadTransformers contravariant distributive
    free keys mtl semigroupoids semigroups transformers
  ];
  meta = {
    homepage = "http://github.com/ekmett/representable-functors/";
    description = "Representable functors";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
