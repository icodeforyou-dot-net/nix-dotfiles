{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unstable.gnome.gnome-tweaks
    gnome.networkmanager-openvpn
    gnome.gnome-terminal
    unstable.gnomeExtensions.dash-to-dock
    gnomeExtensions.tweaks-in-system-menu
    nordic
    orchis-theme
    tela-icon-theme
    pavucontrol
    wl-clipboard
  ];
}
