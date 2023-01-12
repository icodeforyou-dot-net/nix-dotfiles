{ config, lib, pkgs, pkgs-unstable, fetchFromGitHub, ... }:

{


  console = {
    earlySetup = true;
    font = "latarcyrheb-sun32";
    keyMap = "us";
  };

  environment.systemPackages = [ nvidia-offload ];

  fonts = {
    enableDefaultFonts = false;

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  programs.dconf.enable = true;
  programs.light.enable = true;

  security.rtkit.enable = true;
  security.pam.services.swaylock = { };



  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=no
  '';


  services.xserver.dpi = 96;

  system.stateVersion = "22.05";
}
