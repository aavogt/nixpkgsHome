{ stdenv, fetchsvn, clp, osi }:

stdenv.mkDerivation rec {
  name = "Cgl";
  version = "0.58";
  propagatedBuildInputs = [ clp osi ];
  src = fetchsvn {
    inherit name;
    url = "https://projects.coin-or.org/svn/${name}/stable/${version}/" ;
  };
}
