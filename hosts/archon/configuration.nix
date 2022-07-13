{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_5_16.override {
  #   argsOverride = rec {
  #     src = pkgs.fetchurl {
  #           url = "https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-${version}.tar.xz";
  #           sha256 = "05h3b11czr710lilmb5gq84a78cfz3jm03q2q0gcrpcaxq2mzajj";
  #     };
  #     version = "5.16.8";
  #     modDirVersion = "5.16.8";
  #     };
  # });

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
      rocm-opencl-runtime ];
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
  };

  services.xserver.dpi = 144;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.windowManager.openbox.enable = true;

}