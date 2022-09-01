{ config, lib, pkgs, pkgs-unstable, fetchFromGitHub, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.kernelPackages = pkgs.linuxPackages;
  boot.earlyVconsoleSetup = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      mesa_drivers
      intel-ocl
      beignet
    ];
  };

  console = {
    font = "latarcyrheb-sun32";
    keyMap = "us";
  };

  networking.hostName = "perseus";

  powerManagement.powertop.enable = true;

  programs.dconf.enable = true;

  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;
    settings = {
      PCIE_ASPM_ON_BAT = "powersupersave";
    };
  };

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
  };

  services.xserver.dpi = 144;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.naturalScrolling = true;

  system.stateVersion = "22.05";
}
