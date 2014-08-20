{ cabal, applicativeQuoters, regexApplicative, fetchdarcs, ... }:

cabal.mkDerivation (self: {
  pname = "HListPP";
  version = "0.2";
  sha256 = "0jq2sdfg47dqf8gmmzm0049x4hsfh9prgfvxzplhrxsisknyhfr8";
  src = fetchdarcs {
    url = http://code.haskell.org/~aavogt/HListPP ;
    sha256 = "";
  };
  isExecutable = true;
  buildDepends = [ applicativeQuoters regexApplicative ];
  meta = {
    homepage = "http://code.haskell.org/~aavogt/HListPP";
    description = "A preprocessor for HList labelable labels";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
