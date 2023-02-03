{ config, lib, pkgs, pkgs-unstable, ... }:
{
  services.power-profiles-daemon.enable = false;
  powerManagement.powertop.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      PCIE_ASPM_ON_BAT = "powersupersave";
      DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";
    };
  };
}
