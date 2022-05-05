{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "Iosevka" "Overpass" "FiraCode" ]; })
  ];
}
