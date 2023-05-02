{ config, lib, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linux_6_1;
}
