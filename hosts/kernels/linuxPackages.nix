{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages;
}
