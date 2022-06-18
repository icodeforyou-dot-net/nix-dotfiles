{ config, lib, pkgs, ... }:

{ 
  environment.systemPackages = with pkgs; [
    lf
    alacritty
    swaylock
    swayidle
    wl-clipboard
  ];
  
}