{ stdenv, fetchsvn, pkgconfig }:

stdenv.mkDerivation rec {
  name = "CoinUtils";
  version = "2.9";
  propagatedBuildInputs = [ pkgconfig ];
  src = fetchsvn {
    inherit name;
    url = "https://projects.coin-or.org/svn/${name}/stable/${version}/${name}/" ;
  };
}
