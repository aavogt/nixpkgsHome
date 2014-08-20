{ cabal, alex, ansiWlPprint, happy, mtl, pointed, QuickCheck, syb
, transformers, transformersCompat
}:

cabal.mkDerivation (self: {
  pname = "logic-TPTP";
  version = "0.4.2.0";
  sha256 = "1pqs0hr05b4jsnf73fqfgqng3h63dlswlx18142fbkv1bhphg8al";
  buildDepends = [
    ansiWlPprint mtl pointed QuickCheck syb transformers
    transformersCompat
  ];
  buildTools = [ alex happy ];
  meta = {
    description = "Import, export etc. for TPTP, a syntax for first-order logic";
    license = "GPL";
    platforms = self.ghc.meta.platforms;
  };
})
