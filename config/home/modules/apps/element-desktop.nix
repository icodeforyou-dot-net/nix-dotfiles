{ config, pkgs, nixpkgs, ... }:

{
  home.packages = with pkgs; [
    unstable.element-desktop
  ];
}
