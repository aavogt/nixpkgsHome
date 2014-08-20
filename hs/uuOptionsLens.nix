{ cabal, lens, mtl, transformers, uuInterleaved, uuParsinglib,
  fetchgit, ... }:

cabal.mkDerivation (self: {
  pname = "uu-options-lens";
  version = "0.1.0.1";
  src = /home/aavogt/wip/uu-options-lens/dist/uu-options-lens-0.1.0.1.tar.gz;
/*
  src = fetchgit {
    url = http://code.haskell.org/~aavogt/uu-options-lens/.git ;
    sha256 = "c4d9922be7f3872c4ae333c04b35189c77dd061a52c8c5997baa29b6b3a1c318";
    rev = "a774149709dfe56a7803a3478ff013f65a1f287c";
  };
*/
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    lens mtl transformers uuInterleaved uuParsinglib
  ];
  meta = {
    homepage = "http://www.cs.uu.nl/wiki/bin/view/HUT/ParserCombinators";
    description = "Parse command line options using uu-interleave and uu-parsinglib";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
  };
})
