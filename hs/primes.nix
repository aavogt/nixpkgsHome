{ stdenv, cabal }:

cabal.mkDerivation (self: {
  pname = "primes";
  version = "0.2.1.0";
  sha256 = "0ny6fzr967d1fifk050k95j9snnbjjif2bxf3v9s93k3zdc6bmkl";
  doCheck = stdenv.lib.versionOlder "7.7" self.ghc.version;

  /* ghc-7.6 has a stackoverflow:

          recip: [OK, passed 100 tests]
          pthRoot: [OK, passed 100 tests]
          allValues: [Failed]
        *** Failed! Exception: 'stack overflow' (after 1 test): 
        withNat SomeNat 790421
        (used seed 600060401651978471)
          primeFieldT: [OK]

                 Properties   Test Cases  Total       
         Passed  15           1           16          
         Failed  1            0           1           
         Total   16           1           17          
        Test suite TestPrimeField: FAIL
        Test suite logged to: dist/test/finite-field-0.8.0-TestPrimeField.log
        0 of 1 test suites (0 of 1 test cases) passed.

*/

  meta = {
    homepage = "http://github.com/sebfisch/primes";
    description = "Efficient, purely functional generation of prime numbers";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
