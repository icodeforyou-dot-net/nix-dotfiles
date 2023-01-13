{ config, lib, pkgs, pkgs-unstable, ... }:
{
  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
}
