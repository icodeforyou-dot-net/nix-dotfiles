# overlay-custom-kernel = import ./config/sys/modules/kernels/custom-kernels/kernel-5.16.9-source-tree-overlay.nix;

# overlay-custom-kernel = final: prev: {
#   pahole = prev.pahole.overrideAttrs (oldAttrs: {
#     version = "1.23";
#     src = prev.fetchgit {
#       url = "https://git.kernel.org/pub/scm/devel/pahole/pahole.git";
#       rev = "v1.23";
#       sha256 = "sha256-Dt3ZcUfjwdtTTv6qRFRgwK5GFWXdpN7fvb9KhpS1O94=";
#     };

#     buildInputs = [ prev.elfutils prev.zlib final.libbpf-0-7-0 ];
#   });

#   libbpf-0-7-0 = prev.libbpf.overrideAttrs (oldAttrs: {
#     version = "0.7.0";

#     src = prev.fetchFromGitHub {
#       owner = "libbpf";
#       repo = "libbpf";
#       rev = "v0.7.0";
#       sha256 = "sha256-NFVJ8JquWVzu+QoaaOMzhnu6/IqdP1FPhtJFidXA4L4=";
#     };

#     buildInputs = [ prev.libelf prev.zlib ];
#   });
# };
