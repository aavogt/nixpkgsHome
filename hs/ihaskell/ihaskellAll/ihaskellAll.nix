# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, ihaskellAeson, ihaskellBasic, ihaskellBlaze
, ihaskellCharts, ihaskellDiagrams, ihaskellHatex
, ihaskellJuicypixels, ihaskellMagic, ihaskellParsec
, ihaskellRlangqq, ihaskellWidgets
}:

cabal.mkDerivation (self: {
  pname = "ihaskellAll";
  version = "0";
  src = ./dist/ihaskellAll-0.tar.gz;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    ihaskellAeson ihaskellBasic ihaskellBlaze ihaskellCharts
    ihaskellDiagrams ihaskellHatex ihaskellJuicypixels ihaskellMagic
    ihaskellParsec ihaskellRlangqq ihaskellWidgets
  ];
  meta = {
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
  installPhase = '' mkdir -p $out ''; /* don't actually install the executable */
})
