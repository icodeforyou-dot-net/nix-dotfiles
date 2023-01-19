{ config, lib, pkgs, ... }:

{

  hardware.enableAllFirmware = true;

  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
  };


}
