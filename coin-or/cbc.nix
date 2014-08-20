{ stdenv, fetchsvn, cgl }:

stdenv.mkDerivation {
  name = "cbc";
  propagatedBuildInputs = [ cgl ];
  src = fetchsvn {
    url = "https://projects.coin-or.org/svn/Cbc/stable/2.8/Cbc" ;
  };
}
