{ config, pkgs, ... }:

{
  programs.eww = {
    enable = true;
    package = pkgs.unstable.eww-wayland;
    configDir = ./.;
  };
}
