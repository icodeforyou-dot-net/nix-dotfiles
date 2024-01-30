{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnome.dconf-editor
    desktop-file-utils
    unstable.gnome.gnome-tweaks
    catppuccin-gtk
    gnome.networkmanager-openvpn
    gnome.gnome-terminal
    gnome.gnome-boxes
    gnome.polari
    warp
    unstable.amberol
    # don't put nautilus extensions here, see issue https://github.com/NixOS/nixpkgs/issues/126074
    # unstable.nautilus-python
    # unstable.nautilus-open-any-terminal
    unstable.gnomeExtensions.dash-to-dock
    unstable.gnomeExtensions.command-menu
    # gnomeExtensions.tweaks-in-system-menu
    tela-icon-theme
    pavucontrol
    wl-clipboard
    lyrebird
  ];
}
