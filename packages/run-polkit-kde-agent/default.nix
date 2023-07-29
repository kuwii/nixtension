{ stdenv, libsForQt5 }:

stdenv.mkDerivation {
  name="run-polkit-kde-agent-0.0.1";
  unpackPhase = "true";
  installPhase = ''
    BIN=$out/bin/run-polkit-kde-agent
    mkdir -p $out/bin
    echo "#!/usr/bin/env bash" > $BIN
    echo "${libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1" >> $BIN
    chmod +x $BIN
  '';
}
