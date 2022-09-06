{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    grim
    light
    mako
    swaybg
    swaylock
    waybar
    wev
    wlogout
    wofi
    xorg.xev
   ];
}
