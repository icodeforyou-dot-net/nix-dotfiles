{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unstable.eww-wayland
    unstable.grim
    unstable.light
    unstable.mako
    unstable.swaybg
    unstable.swaylock
    unstable.waybar
    wev
    unstable.wlogout
    unstable.wofi
    xorg.xev
   ];
}
