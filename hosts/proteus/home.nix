{ config, pkgs, ... }:

{
  xresources.properties = {
    "Xft.dpi" = 192;
    "Xft.antialias" = true;
    "Xft.autohint" = false;
    "Xft.lcdfilter" = "lcddefault";
    "Xft.hintsyle" = "hintful";
    "URxvt.foreground" = "White";
  };
}
