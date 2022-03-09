{
  beta = import ./browser.nix {
    channel = "beta";
    version = "99.0.1150.30";
    revision = "1";
    sha256 = "sha256:0vibyf6xi7czss3dz32knvgiqsch34mcmqi5cggddrb7w36g4avj";
  };
  dev = import ./browser.nix {
    channel = "dev";
    version = "100.0.1181.0";
    revision = "1";
    sha256 = "sha256:16ywc6n5n01sicfrd0l8rs4jsfhfagibn5840vn9l63gbff741z6";
  };
  stable = import ./browser.nix {
    channel = "stable";
    version = "99.0.1150.36";
    revision = "1";
    sha256 = "sha256:1kkp5wsiifm0rb43wh7yf93cs5m8apcb6x77jf9qpd7pgm5mnr5g";
  };
}
