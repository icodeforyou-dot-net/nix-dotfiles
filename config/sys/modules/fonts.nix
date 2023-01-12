{ config, lib, pkgs, pkgs-unstable, ... }:

{
  fonts = {
    enableDefaultFonts = false;

    fonts = with pkgs; [
      material-icons
      material-design-icons
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      # Replacement for Times New Roman, Arial
      liberation_ttf
      google-fonts
    ];

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

}
