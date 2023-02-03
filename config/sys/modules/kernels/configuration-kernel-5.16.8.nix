{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_5_16.override {
    argsOverride = rec {
      src = pkgs.fetchurl {
        url = "https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-${version}.tar.xz";
        sha256 = "05h3b11czr710lilmb5gq84a78cfz3jm03q2q0gcrpcaxq2mzajj";
      };
      version = "5.16.8";
      modDirVersion = "5.16.8";
    };
  });
}
