{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unstable.grim
    unstable.mako
    unstable.swaybg
    unstable.swaylock
    unstable.waybar
    wev
    unstable.wlogout
    unstable.wofi
    xorg.xev
    bc
    bluez
    playerctl
  ];
}
