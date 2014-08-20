{ stdenv, fetchsvn, bonmin }:


stdenv.mkDerivation rec {
  name = "Couenne";
  version = "0.4";
  propagatedBuildInputs = [ bonmin ];
  src = fetchsvn {
    inherit name;
    url = "https://projects.coin-or.org/svn/${name}/stable/${version}/${name}/" ;
  };
}
