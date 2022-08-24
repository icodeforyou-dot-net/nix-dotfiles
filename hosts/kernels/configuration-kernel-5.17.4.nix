{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_5_17.override {
    argsOverride = rec {
      src = pkgs.fetchurl {
        url = "https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-${version}.tar.xz";
        sha256 = "1ifkl1j5dimipqxwki26i4v6gav70g24456y7ynbb71sx1pdag3f";
      };
      version = "5.17.4";
      modDirVersion = "5.17.4";
    };
  });
}
