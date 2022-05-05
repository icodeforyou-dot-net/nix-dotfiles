{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_5_16.override {
    argsOverride = rec {
      src = pkgs.fetchurl {
            url = "https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-${version}.tar.xz";
            sha256 = "0kvlidg7qgj49in9h92sw0dnnzyrvqax2fcpq63w36f2iqiffq0n";
      };
      version = "5.16.9";
      modDirVersion = "5.16.9";
      };
  });
}