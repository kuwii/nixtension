{
  beta = import ./browser.nix {
    channel = "beta";
    version = "99.0.1150.38";
    revision = "1";
    sha256 = "sha256:0c2a08y39i7gqs49lbx6zi95nkk00vkisgq023y351dslmd8nhb8";
  };
  dev = import ./browser.nix {
    channel = "dev";
    version = "100.0.1181.0";
    revision = "1";
    sha256 = "sha256:16ywc6n5n01sicfrd0l8rs4jsfhfagibn5840vn9l63gbff741z6";
  };
  stable = import ./browser.nix {
    channel = "stable";
    version = "99.0.1150.38";
    revision = "1";
    sha256 = "sha256:0liajjaq8q5qv1sbf1khpvhagb7fyvmjl981zi5g98r4kjhfm3hr";
  };
}
