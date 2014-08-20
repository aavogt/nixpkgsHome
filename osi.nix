{ stdenv, fetchsvn, coinUtils }:

stdenv.mkDerivation rec {
  name = "Osi";
  version = "0.106";
  buildInputs = [ coinUtils ];
  src = fetchsvn {
    inherit name;
    url = "https://projects.coin-or.org/svn/${name}/stable/${version}/${name}/" ;
  };
}
