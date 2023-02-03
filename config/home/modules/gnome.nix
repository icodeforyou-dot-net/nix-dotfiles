{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    desktop-file-utils
    unstable.gnome.gnome-tweaks
    catppuccin-gtk
    gnome.networkmanager-openvpn
    gnome.gnome-terminal
    unstable.gnomeExtensions.dash-to-dock
    gnomeExtensions.tweaks-in-system-menu
    tela-icon-theme
    pavucontrol
    wl-clipboard
    lyrebird
  ];
}
