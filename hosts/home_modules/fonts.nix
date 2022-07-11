{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "CascadiaCode" "DejaVuSansMono" "JetBrainsMono" "Inconsolata" "Iosevka" "Overpass" "FiraCode" ]; })
  ];
}
