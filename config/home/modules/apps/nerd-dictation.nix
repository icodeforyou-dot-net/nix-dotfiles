{ config, pkgs, nixpkgs, ... }:

{
  home.packages = with pkgs; [
    nerd-dictation
    unstable.dotool
  ];
}
