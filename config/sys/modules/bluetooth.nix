{ config, lib, pkgs, pkgs-unstable, fetchFromGitHub, ... }:
{
  hardware.bluetooth = {
    enable = true;
    # disabledPlugins = [ "sap" ];
    # hsphfpd.enable = true;
    package = pkgs.bluez;
    powerOnBoot = false;
  };

  services.blueman.enable = true;
}
