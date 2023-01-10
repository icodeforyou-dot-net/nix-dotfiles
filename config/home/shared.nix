{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "ap";
  home.homeDirectory = "/home/ap";
  home.stateVersion = "22.11";

  # xdg.userDirs = {
  #       enable = true;
  #       documents = "$HOME/misc/";
  #       download = "$HOME/Downloads/";
  #       videos = "$HOME/misc/";
  #       music = "$HOME/misc/";
  #       pictures = "$HOME/Pictures/";
  #       desktop = "$HOME/misc/";
  #       publicShare = "$HOME/misc/";
  #       templates = "$HOME/misc/";
  #   };

  xresources.properties = {
    "Xft.antialias" = true;
    "Xft.autohint" = false;
    "Xcursor.theme" = "Simp1e-Catppuccin-Frappe";
    "Xft.lcdfilter" = "lcddefault";
    "Xft.hintsyle" = "hintful";
  };
}
