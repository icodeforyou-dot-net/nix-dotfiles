{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  gnome.gnome-tweaks
  gnome.networkmanager-openvpn
  unstable.gnomeExtensions.dash-to-dock
  gnomeExtensions.tweaks-in-system-menu
  gnomeExtensions.gnome-vagrant-indicator
  flat-remix-gtk
  flat-remix-icon-theme
  papirus-icon-theme
  nordic
  tela-icon-theme
  lyrebird
  pavucontrol
  ];
}