{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  dosbox-staging
  openra
  openraPackages.mods.yr
  openraPackages.mods.ss
  openraPackages.mods.ura
  openraPackages.mods.raclassic
  ];
}