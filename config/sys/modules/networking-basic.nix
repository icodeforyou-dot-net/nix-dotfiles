{ config, lib, pkgs, pkgs-unstable, ... }:
{
  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
  };
}
