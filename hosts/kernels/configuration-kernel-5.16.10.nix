{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_5_16.override {
    argsOverride = rec {
      src = pkgs.fetchurl {
        url = "https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-${version}.tar.xz";
        sha256 = "17i3j07hgljsiz2kymbskp35p2xp14gb0mdi5s2r61c0h406yk8c";
      };
      version = "5.16.10";
      modDirVersion = "5.16.10";
    };
  });
}
