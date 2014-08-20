{ stdenv, makeWrapper, doctestCore, ghc }:

stdenv.mkDerivation {
  name = "doctest";
  buildInputs = [makeWrapper];
  propagatedBuildInputs = [doctestCore ghc];
  unpackPhase = "true";
  inherit doctestCore;
  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    makeWrapper $doctestCore/bin/doctestCore $out/bin/doctest-${ghc.version} --add-flags "\$(${ghc.GHCGetPackages} ${ghc.version} \"\$(dirname \$0)\")"
    ln $out/bin/doctest-${ghc.version} $out/bin/doctest
  '';
}
