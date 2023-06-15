{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnome.dconf-editor
    desktop-file-utils
    unstable.gnome.gnome-tweaks
    catppuccin-gtk
    gnome.networkmanager-openvpn
    gnome.gnome-terminal
    unstable.nautilus-open-any-terminal
    unstable.gnomeExtensions.dash-to-dock
    gnomeExtensions.tweaks-in-system-menu
    tela-icon-theme
    pavucontrol
    wl-clipboard
    lyrebird
  ];
}
