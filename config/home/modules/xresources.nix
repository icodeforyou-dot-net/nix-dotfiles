{ config, pkgs, ... }:

{
  xresources.properties = {
    "Xft.antialias" = true;
    "Xft.autohint" = false;
    "Xcursor.theme" = "Simp1e-Catppuccin-Frappe";
    "Xft.lcdfilter" = "lcddefault";
    "Xft.hintsyle" = "hintful";
  };
}
