{ stdenv, fetchsvn, coinUtils }:

stdenv.mkDerivation rec {
  name = "Clp";
  version = "1.9";
  propagatedBuildInputs = [ coinUtils ];
  src = fetchsvn {
    inherit name;
    url = "https://projects.coin-or.org/svn/${name}/stable/${version}/" ;
    rev = 2046;
  };
}
