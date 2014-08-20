{ stdenv, fetchurl, python, unzip, autoreconfHook }:

stdenv.mkDerivation rec {
  name = "z3-${version}";
  version = "4.3.2";
  src = fetchurl {
    url    = "http://z3.codeplex.com/downloads/get/888399";
    name   = "${name}.zip";
    sha256 = "0xzvvjzhn8iz3xpx5axffvxxddx9k839bl1w18d99gsa096nj8c1";
  };

  buildInputs = [ python unzip autoreconfHook ];
  enableParallelBuilding = true;

  # The zip file doesn't unpack a directory, just the code itself.
  unpackPhase = "mkdir ${name} && cd ${name} && unzip $src";
  postConfigure = ''
    python scripts/mk_make.py
    cd build
  '';

  # z3's install phase is stupid because it tries to calculate the
  # python package store location itself, meaning it'll attempt to
  # write files into the nix store, and fail.
  soext = if stdenv.system == "x86_64-darwin" then ".dylib" else ".so";
  installPhase = ''
    mkdir -p $out/bin $out/lib/${python.libPrefix}/site-packages $out/include
    cp ../src/api/z3.h        $out/include
    cp ../src/api/z3_api.h    $out/include
    cp ../src/api/z3_v1.h     $out/include
    cp ../src/api/z3_macros.h $out/include
    cp ../src/api/c++/z3++.h  $out/include
    cp z3                     $out/bin
    cp libz3${soext}          $out/lib
    cp libz3${soext}          $out/lib/${python.libPrefix}/site-packages
    cp z3*.pyc                $out/lib/${python.libPrefix}/site-packages
  '';

  meta = {
    description = "Z3 is a high-performance theorem prover and SMT solver";
    homepage    = "http://z3.codeplex.com";
    license     = stdenv.lib.licenses.msrla;
    platforms   = stdenv.lib.platforms.unix;
    maintainers = [ stdenv.lib.maintainers.thoughtpolice ];
  };
}
