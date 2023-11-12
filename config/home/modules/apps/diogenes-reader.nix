{ config, pkgs, nixpkgs, ... }:

{
  home.packages = with pkgs; [
    diogenes-reader
  ];
}
