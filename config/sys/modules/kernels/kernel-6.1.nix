{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_6_1;
}
