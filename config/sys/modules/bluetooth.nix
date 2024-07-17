{ pkgs, ... }:
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
