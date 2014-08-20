{ stdenv, fetchsvn, ipopt, cbc, coinUtils }:


stdenv.mkDerivation rec {
  name = "Bonmin";
  version = "1.7";
  propagatedBuildInputs = [ ipopt cbc ];
  src = fetchsvn {
    inherit name;
    url = "https://projects.coin-or.org/svn/${name}/stable/${version}/${name}/" ;
  };
}
