{ pkgs, ... }:

{
  boot.kernelPackages = let
      linux_pkg = { fetchurl, buildLinux, ... } @ args:

        buildLinux (args // rec {
          version = "5.15.43";
          modDirVersion = version;

        src = pkgs.fetchurl {
            url = "https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-${version}.tar.xz";
            sha256 = "sha256-BkuROp1YdzqFyvpi8qL5Axru5yTX5BtmYxA32aZXHBI=";
        };
        
          kernelPatches = [];

          extraMeta.branch = "5.15";
        } // (args.argsOverride or {}));
      linux_5-15-43 = pkgs.callPackage linux_pkg{};
    in 
      pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_5-15-43);
}