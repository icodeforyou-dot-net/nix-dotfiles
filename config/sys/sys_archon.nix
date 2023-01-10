{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      mesa_drivers
      rocm-opencl-icd
      rocm-opencl-runtime
    ];
  };

  hardware.opentabletdriver.enable = true;

  hardware.pulseaudio.enable = true;

  networking.hostName = "archon";

  virtualisation.virtualbox = {
    guest.enable = false;
    host = {
      enable = true;
      enableHardening = true;
      enableExtensionPack = true;
    };
  };

  programs.dconf.enable = true;

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
    videoDrivers = [ "amdgpu" ];
  };

  services.xserver.dpi = 144;
  services.xserver.displayManager.gdm.enable = true;

  system.stateVersion = "21.05";

}
