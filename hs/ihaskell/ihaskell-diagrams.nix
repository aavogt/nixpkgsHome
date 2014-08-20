{ cabal, classyPrelude, diagrams, diagramsCairo, diagramsLib
, ihaskell, src
}:

cabal.mkDerivation (self: {
  inherit src;
  pname = "ihaskell-diagrams";
  version = "0.1.0.0";
  sha256 = "";
  buildDepends = [
    classyPrelude diagrams diagramsCairo diagramsLib ihaskell
  ];
  meta = {
    homepage = "http://www.github.com/gibiansky/ihaskell";
    description = "IHaskell display instances for diagram types";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
