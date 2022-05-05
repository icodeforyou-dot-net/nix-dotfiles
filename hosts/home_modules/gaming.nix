{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  dosbox-staging 
  ];
}