{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "CascadiaCode" "JetBrainsMono" "Iosevka" "Overpass" "FiraCode" ]; })
  ];
}
