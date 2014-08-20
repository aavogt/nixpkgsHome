{ stdenv, fetchurl, gfortran, blas, liblapack }:

stdenv.mkDerivation rec {
  name = "Ipopt-3.11.8";

  buildInputs = [gfortran blas liblapack];
  preConfigure = "export CXXFLAGS=--std=gnu++11";
  src = fetchurl {
    url = "http://www.coin-or.org/download/source/Ipopt/${name}.tgz";
    sha256 = "9f9b76075fbd9315286ea4d7c159c94cab4a4fb16122fb172b24910af5b5b75b";
  };

  meta = {
    homepage = https://projects.coin-or.org/Ipopt;
    description = "A software package for large-scale nonlinear optimization";
    license = "EPL";
  };
}
