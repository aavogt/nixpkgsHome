{ cabal, stm }:

cabal.mkDerivation (self: {
  pname = "queue";
  version = "0.1.2";
  sha256 = "0fx2svkj2sy2wd056lha9h20hy2z6gjspzl11jmv7i3rdwwfr6f7";
  buildDepends = [ stm ];
  meta = {
    homepage = "http://code.haskell.org/~mokus/queue";
    description = "Abstraction typeclasses for queue-like things";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
