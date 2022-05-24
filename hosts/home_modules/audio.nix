{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    unstable.ardour
    obs-studio
  ];
}