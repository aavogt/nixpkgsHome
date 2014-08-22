{
  packageOverrides = pkgs:
  rec {

  haskellPackagesExtension = call : self : super :
    let override = pk : extension :
          (builtins.getAttr pk super).override (x : { cabal = x.cabal.override { 
            extension = if builtins.isFunction extension then extension
                            else self : super : extension; } ; }) ;
        inherit (pkgs) fetchgit;
        inherit (pkgs.stdenv.lib) versionOlder;
    in {

      /* ghc comes with terminfo-0.4.0.0 and xhtml-3000.2.1.
         but they are broken */
      terminfo = override "terminfo" { patches = ./hs/terminfoBump.diff;
                                       version = "0.4.0.1"; };
      xhtml = override "xhtml" { patches = ./hs/xhtmlBump.diff;
                                       version = "3000.2.2"; };


      HList              = call ./hs/HList.nix {};
      HListPP            = call ./hs/HListPP.nix {};
      uuOptionsLens      = call ./hs/uuOptionsLens.nix {};
      RlangQQ            = call ./hs/RlangQQ.nix {};
      HOpenCV            = call ./hs/HOpenCV.nix {};
      xmonadDyre         = call ./hs/xmonadDyre.nix {};
      xmonadContribDyre  = call ./hs/xmonadContribDyre.nix {};


      lmqq               = call ./hs/lmqq.nix {};
      hmatrixLabeled     = call ./hs/hmatrixLabeled.nix {};
      setlocale          = call ./hs/setlocale.nix {};

      CTRex              = call ./hs/CTRex.nix {};

      /* just missing from nixpkgs */
      KdTree             = call ./hs/KdTree.nix {};
      Adaptive           = call ./hs/Adaptive.nix {};
      gtksourceview3     = call ./hs/gtksourceview3.nix {};
      gtk3               = call ./hs/gtk3.nix {};
      hmatrixSyntax      = call ./hs/hmatrixSyntax.nix {};
      xformat            = call ./hs/xformat.nix {};
      here               = call ./hs/here.nix {};
      systemArgv0        = call ./hs/systemArgv0.nix {};
      OrPatterns         = call ./hs/OrPatterns.nix {};
      hothasktags        = call ./hs/hothasktags.nix { haskellSrcExts = self.haskellSrcExts115; };
      standaloneHaddock  = call ./hs/standaloneHaddock.nix { Cabal = self.Cabal_1_20_0_2; };
      PartialTypeSignatures = call ./hs/PartialTypeSignatures.nix {};

      toysolver          = call ./hs/toysolver.nix {};
      algebra            = call ./hs/algebra.nix {};
      dataInterval       = call ./hs/dataInterval.nix {};
      finiteField        = call ./hs/finiteField.nix {};
      heaps              = call ./hs/heaps.nix {};
      lattices           = call ./hs/lattices.nix {};
      logicTPTP          = call ./hs/logicTPTP.nix {};
      OptDir             = call ./hs/OptDir.nix {};
      parseDimacs        = call ./hs/parseDimacs.nix {};
      primes             = call ./hs/primes.nix {};
      queue              = call ./hs/queue.nix {};
      typeLevelNumbers   = call ./hs/typeLevelNumbers.nix {};
      intern             = call ./hs/intern.nix {};
      sign               = call ./hs/sign.nix {};
      representableTries = call ./hs/representableTries.nix {};
      haskell_magic      = call ./hs/magic.nix {};


      psim = call /home/aavogt/wip/psim/psim.nix {};

      /* haskell-src-exts from git to work with DataKinds
         there are several breaking changes so a few packages
         need patches to work with this hse
       */
      haskellSrcExts       = override "haskellSrcExts" {
             src = fetchgit {
               url = git://github.com/haskell-suite/haskell-src-exts.git;
               rev = "42b48dca808f09e429a9056dfb6edabb6f68eaa8";
               sha256 = "dfcd26f67c08841891c364c546113ded9b674939ea0a8b6ea974a044ae6cbd39";
             }; };
      haskellSrcExts115 = super.haskellSrcExts; /* reference the old one */

      haskellSrcMeta = override "haskellSrcMeta" {
             src = fetchgit {
              url = "git://github.com/aavogt/haskell-src-meta.git";
              sha256 = "36f07c7f721ecce1b47e62f3582db916fb66dab98ceff84c1fd28ca66eef4c81";
              rev = "51bd038bf409bc8cc2b5170c27ec13efaf5f34da";
            }; };
 
      testFrameworkThPrime = override "testFrameworkThPrime" {
             src = fetchgit {
               url = git://github.com/aavogt/test-framework-th-prime.git;
               rev = "b70454da2ed836c97a11c3c9c22406e3189f44c8";
               sha256 = "7261dd455dd72a542f43527474a3e19dbc95f49ebf9930b84c9d4f26b4088edc";
             }; };

      hlint = override "hlint" { patches = ./hs/hlint_compat.diff; };

      /* needs an ipopt package that is missing and it depends on HList-0.4  */
      ipoptHs            = call ./hs/ipoptHs.nix { inherit ipopt; inherit nlopt; };

      /* selecting alternative versions for ghc763 */
      repa = override "repa" (if (versionOlder "7.8" self.ghc.version)
                then { } /* ghc-7.8 needs no changes */
                else {
                        version = "3.2.3.3";
                        sha256 = "0rdny7yjcmz9iy07sqnjmwyr58f0kyzzdycwi55j963rb4vqkacn";
                        jailbreak = true;
              });

      singletons = override "singletons" (if (versionOlder "7.8" self.ghc.version)
          then {} /* hackage version works with 7.8 */
          else {
            version = "0.10.0";
            sha256 = "14vnkw9ihrs3xg3lhb3wkyfz59lsaz4c3iqh3hqy7x9gmifgggwr";
      });

      sbv = override "sbv" { doCheck = false; };

    } // import ./hs/ihaskell.nix { callPackage = call; inherit pkgs; } ;
       /* odepackHs cassavaTH acidBase psim */



    applyHaskellPackagesExtension = hspkgs : rec {
      self = let callPackage = pkgs.lib.callPackageWith
                      (pkgs
                        // hspkgs
                        // self
                        // { haskellPackages = self;
                             cabal = self.cabal.override {
                                    extension = self : super : {
                                        noHaddock = ! pkgs.lib.versionOlder "7.7" self.ghc.version;
                                        configureFlags = super.configureFlags or
                                            "" + pkgs.lib.optionalString (! pkgs.lib.versionOlder "7.7" self.ghc.version) "-O0" ;
                            };  }; }  );
                
            in pkgs.recurseIntoAttrs (hspkgs.override {
                      extension = haskellPackagesExtension callPackage; });
    }.self;

     myREnv = pkgs.buildEnv {
       name = "R-packages";
       paths =
        with pkgs.rPackages;
          [ akima AlgDesign crs data_table directlabels knitr flexmix
         gdata ggdendro ggmap dplyr ggplot2 scam deSolve
         plyr polynom reshape2
         lattice lpSolve lpSolveAPI
         rootSolve
         ];
       /* my: controltheory */
     };


     /* coin-or */
     bonmin = pkgs.callPackage ./coin-or/bonmin.nix {};
     cbc = pkgs.callPackage ./coin-or/cbc.nix {};
     cgl = pkgs.callPackage ./coin-or/cgl.nix {};
     clp = pkgs.callPackage ./coin-or/clp.nix {};
     coinUtils = pkgs.callPackage ./coin-or/coinUtils.nix {};
     couenne = pkgs.callPackage ./coin-or/couenne.nix {};
     ipopt = pkgs.callPackage ./coin-or/ipopt.nix {};
     osi = pkgs.callPackage ./coin-or/osi.nix {};

     nlopt = pkgs.callPackage ./nlopt.nix {}; /* minor variation on the existing nlopt package (remove --with-cxx) */

     /* z3 = pkgs.callPackage ./z3.nix {}; */ /* need 4.3.2 to work with sbv */

    otherPkgs = with pkgs;
      [ nix
        nix-prefetch-scripts

        bonmin
        couenne
        ipopt
        nlopt

        gfortran
        pkgconfig
        libf2c

        opencv

        wxmaxima maxima
        /* z3 */
        zsh
      ];


    withGhc = version : selectPkgs :
      let hspkgs = builtins.getAttr ("haskellPackages_ghc" + toString version) pkgs;
      in (applyHaskellPackagesExtension hspkgs).ghcWithPackages selectPkgs ;
         
    haskellEnv = pkgs.buildEnv {
        name = "haskellEnv";
        ignoreCollisions = true; /* the first one wins */
        paths = [
         (withGhc 783 (theGhc : with theGhc;
                 ihaskellAll ++
                [ad
                 Adaptive
                 ansiWlPprint
                 BoundedChan
                 c2hs
                 cabal2nix
                 cabalInstall_1_20_0_3
                 cairo
                 cmdargs
                 colour
                 conduit
                 criterion
                 CTRex
                 dataDefaultClass
                 diagramsCairo
                 diagramsCore
                 diagramsLib
                 doctest
                 fgl
                 filepath
                 ghcCore
                 ghcMod
                 glpkHs
                 gtk3
                 gtksourceview3
                 haskellSrcExts
                 haskellSrcMeta
                 highlightingKate
                 HList
                 HListPP
                 HOpenCV
                 hothasktags
                 hscolour
                 hspec
                 hxt
                 hxtXpath
                 ipoptHs
                 ipprint
                 KdTree
                 lens
                 lmqq
                 logict
                 monadLoops
                 mtl
                 numbers
                 optparseApplicative
                 OrPatterns
                 parallelIo
                 PartialTypeSignatures
                 psim
                 QuickCheck
                 randomShuffle
                 resourcet
                 RlangQQ
                 sbv
                 singletons
                 standaloneHaddock
                 svgcairo
                 syb
                 temporary
                 terminfo
                 text
                 transformers
                 trifecta
                 uuOptionsLens
                 vector
                 vinyl
                 xformat
                 xmobar
                 xmonadContribDyre
                 xmonadDyre
                ]))

         (withGhc 763 (theGhc : with theGhc;
                 ihaskellAll ++
                [xmonadDyre
                 xmonadContribDyre
                 HList
                 plugins
                 /* toysolver */ ]))
         (withGhc 742 (theGhc : with theGhc;
                [xmonadDyre
                 xmonadContribDyre]))
         (withGhc 6123 (theGhc : with theGhc;
                [xmonadDyre
                 xmonadContribDyre]))
        ]; 
    };



    # same can be done for
    # myPerlEnv = perl and libs
    # myPythonEnv = python and libs
    # myGimp = gimp and plugins
    all = pkgs.buildEnv { name = "all";
        paths = [haskellEnv
                 myREnv
                 otherPkgs ]; };
  };
}
