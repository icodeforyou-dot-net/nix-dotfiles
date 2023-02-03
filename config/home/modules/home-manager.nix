{ config, pkgs, ... }:

{
  home = {
    username = "ap";
    homeDirectory = "/home/ap";
    stateVersion = "22.11";
  };

  nixpkgs.config = { allowUnfree = true; };
  # nixpkgs.overlays = [ overlay-unstable overlay-custom ];

  programs.home-manager.enable = true;
}
