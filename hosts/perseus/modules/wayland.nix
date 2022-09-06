{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    grim
    mako
    swaylock
    waybar
   ];
}
