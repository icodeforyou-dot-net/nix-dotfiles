{ pkgs, ... }:

{
  boot.kernelPackages = let
      linux_pkg = { fetchurl, buildLinux, ... } @ args:

        buildLinux (args // rec {
          version = "5.16.9";
          modDirVersion = version;

        src = pkgs.fetchurl {
            url = "https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-${version}.tar.xz";
            sha256 = "0kvlidg7qgj49in9h92sw0dnnzyrvqax2fcpq63w36f2iqiffq0n";
        };
        
          kernelPatches = [];

          extraMeta.branch = "5.16";
        } // (args.argsOverride or {}));
      linux_sgx = pkgs.callPackage linux_pkg{};
    in 
      pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_sgx);
}