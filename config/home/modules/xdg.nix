{ config, pkgs, ... }:

{
  xdg.userDirs = {
    enable = true;
    documents = "$HOME/misc/";
    download = "$HOME/Downloads/";
    videos = "$HOME/misc/";
    music = "$HOME/misc/";
    pictures = "$HOME/Pictures/";
    desktop = "$HOME/misc/";
    publicShare = "$HOME/misc/";
    templates = "$HOME/misc/";
  };
}
