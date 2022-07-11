{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Foot wayland terminal
    unstable.foot
    # hyprland compositor
    unstable.hyprland
    # terminal file manager
    unstable.lf
    # Wofi wayland launcher
    unstable.wofi
    # Command-line copy/paste utilities for Wayland
    wl-clipboard
    # wayland based logout menu
    unstable.wlogout
    # Xfce file manager
    unstable.xfce.thunar
  ];

  # Mako, lightweight notification daemon for Wayland
  programs.mako = {
    enable = true;
  };

  # Waybar
  programs.waybar = {
    enable = true;
  };
}