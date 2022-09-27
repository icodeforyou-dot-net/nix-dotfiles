{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unstable.eww-wayland
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

  services = {
    easyeffects.enable = true;
    playerctld.enable = true;
  };
}
