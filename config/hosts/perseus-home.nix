{ config, pkgs, ... }:

{
  imports = [
    ../home/modules/apps/element-desktop-wrapped.nix
    ../home/modules/apps/nerd-dictation.nix
    ../home/modules/eww/eww.nix
    ../home/modules/mako/mako.nix
    ../home/modules/cli-os.nix
    ../home/modules/editors.nix
    # ../home/modules/fonts.nix
    ../home/modules/gnome.nix
    ../home/modules/gui.nix
    ../home/modules/home-manager.nix
    ../home/modules/languages.nix
    ../home/modules/swaylock.nix
    ../home/modules/wayland.nix
    #../home/modules/xdg.nix
    ../home/modules/xresources.nix
  ];

  xresources.properties = {
    "Xft.dpi" = 96;
  };
}
