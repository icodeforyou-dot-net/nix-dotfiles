{ config, pkgs, ... }:

{
  xresources.properties = {
    "Xft.dpi" = 144;
    "Xft.antialias" = true;
    "Xft.autohint" = false;
    "Xft.lcdfilter" = "lcddefault";
    "Xft.hintsyle" = "hintful";
    "URxvt.foreground" = "White";
  };
}