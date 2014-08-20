{ cabal, adjunctions, categories, distributive, keys, mtl, nats
, representableTries, semigroupoids, semigroups, tagged
, transformers, void
}:

cabal.mkDerivation (self: {
  pname = "algebra";
  version = "3.1";
  src = /home/aavogt/wip/algebra/dist/algebra-3.1.tar.gz;
  /* sha256 = "0k0sngyagc9bhkjs3nxn8cr26qr64fbn88jh5hg2w7jsk1ffiiwp"; */
  buildDepends = [
    adjunctions categories distributive keys mtl nats
    representableTries semigroupoids semigroups tagged transformers
    void
  ];
  meta = {
    homepage = "http://github.com/ekmett/algebra/";
    description = "Constructive abstract algebra";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
