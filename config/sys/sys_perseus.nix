{ config, lib, pkgs, pkgs-unstable, fetchFromGitHub, ... }:

{
  networking.wireless.iwd.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  programs.dconf.enable = true;
  programs.light.enable = true;

  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=no
  '';


  system.stateVersion = "22.05";
}
