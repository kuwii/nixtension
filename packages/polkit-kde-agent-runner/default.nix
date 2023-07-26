{ stdenv, libsForQt5 }:

stdenv.mkDerivation {
  name="polkit-kde-agent-runner-0.0.1";
  unpackPhase = "true";
  installPhase = ''
    BIN=$out/bin/run-polkit-kde-agent-runner
    mkdir -p $out/bin
    echo "#!/usr/bin/env bash" > $BIN
    echo "${libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1" >> $BIN
    chmod +x $BIN
  '';
}
