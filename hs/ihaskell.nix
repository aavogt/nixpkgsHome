{ callPackage, pkgs } : 
  let 
  /* update hashes with
      nix-prefetch-git --url git://github.com/gibiansky/IHaskell.git --rev HEAD

    or just change
      ihaskellSrc = /path/to/local/IHaskellRepo
  */
  ihaskellSrc = pkgs.fetchgit {
    url = git://github.com/gibiansky/IHaskell.git ;
    sha256 = "1e7c6384479da94df193ea97001fdb8d3b087e1c2c15ba7fde6eb3d8f27952b7";
    rev = "2e6a0756ca0b100f92983cffe4829e8156b65a67" ;
  };

  src = next : ihaskellSrc + next;
  srcD = next : src ("/ihaskell-display/"+ next);

  callD = p : callPackage p { src = srcD (baseNameOf
                                    (pkgs.lib.removeSuffix
                                            ".nix"
                                            (builtins.toString p))); };


  ihaskellAll = {
    ghcParser           = callPackage ./ihaskell/ghc-parser.nix { src = src "/ghc-parser"; } ;


    ihaskell = callPackage ./ihaskell/ihaskell.nix { src = src ""; };

    ihaskellAeson       = callD ./ihaskell/ihaskell-aeson.nix;
    ihaskellBasic       = callD ./ihaskell/ihaskell-basic.nix;
    ihaskellBlaze       = callD ./ihaskell/ihaskell-blaze.nix;
    ihaskellCharts      = callD ./ihaskell/ihaskell-charts.nix;
    ihaskellDiagrams    = callD ./ihaskell/ihaskell-diagrams.nix;
    ihaskellHatex       = callD ./ihaskell/ihaskell-hatex.nix;
    ihaskellJuicypixels = callD ./ihaskell/ihaskell-juicypixels.nix;
    ihaskellMagic       = callD ./ihaskell/ihaskell-magic.nix ;
    ihaskellParsec      = callD ./ihaskell/ihaskell-parsec.nix ;
    ihaskellRlangqq     = callD ./ihaskell/ihaskell-rlangqq.nix ;
    ihaskellWidgets     = callD ./ihaskell/ihaskell-widgets.nix ;

  }; in ihaskellAll // { ihaskellAll =
      let attrValues = set: map (name: builtins.getAttr name set) (builtins.attrNames set);
      in attrValues(ihaskellAll); }
