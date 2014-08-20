{ cabal, hmatrix, parsec, fetchgit }:

cabal.mkDerivation (self: {
  pname = "hmatrix-labeled";
  version = "0.1.0.0";
  jailbreak = true;
  src = fetchgit {
    url = "git://git.gitorious.org/hmatrix-labeled/hmatrix-labeled";
    rev = "bbb914c226a30b3994e4dc258923359d76a68dbd";
    sha256 = "3c073467bb3e472230ae31bdacc8dc7346ea6fd3659e7a444839664a631a338c";
  };
  buildDepends = [ hmatrix parsec ];
  meta = {
    homepage = "https://gitorious.org/hmatrix-labeled";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
