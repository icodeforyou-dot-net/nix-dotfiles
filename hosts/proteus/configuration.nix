{ config, lib, pkgs, pkgs-unstable, fetchFromGitHub, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.consoleMode = "auto";
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

  networking.hostName = "proteus";

  powerManagement.powertop.enable = true;

  programs.dconf.enable = true;
  programs.sway.enable = false;
  programs.xwayland.enable = true;

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

  # environment.systemPackages = [ pkgs.wayland ];

  services.xserver.dpi = 192;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.sddm.enable = false;
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.naturalScrolling = true;

  # security.polkit.enable = true;
  # fonts.enableDefaultFonts = true;
  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];

  system.stateVersion = "21.05";
}

