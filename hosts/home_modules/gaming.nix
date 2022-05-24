{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  dosbox-staging
  unstable.openra
  unstable.openraPackages.mods.yr
  unstable.openraPackages.mods.ss
  unstable.openraPackages.mods.ura
  unstable.openraPackages.mods.raclassic
  ];
}