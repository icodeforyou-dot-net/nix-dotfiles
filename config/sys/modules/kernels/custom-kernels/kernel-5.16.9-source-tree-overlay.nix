final: prev: {
  pahole = prev.pahole.overrideAttrs (oldAttrs: {
    version = "1.23";
    src = prev.fetchgit {
      url = "https://git.kernel.org/pub/scm/devel/pahole/pahole.git";
      rev = "v${version}";
      sha256 = "sha256-Dt3ZcUfjwdtTTv6qRFRgwK5GFWXdpN7fvb9KhpS1O94=";
    };

    buildInputs = [ elfutils zlib libbpf-0-7-0 ]
      ++ lib.optional stdenv.hostPlatform.isMusl [
      argp-standalone
      musl-obstack
    ];
  });

  libbpf-0-7-0 = prev.libbpf.overrideAttrs (oldAttrs: {
    version = "0.7.0";

    src = fetchFromGitHub {
      owner = "libbpf";
      repo = "libbpf";
      rev = "v${version}";
      sha256 = "sha256-NFVJ8JquWVzu+QoaaOMzhnu6/IqdP1FPhtJFidXA4L4=";
    };

    buildInputs = [ libelf zlib ];
  });
};
