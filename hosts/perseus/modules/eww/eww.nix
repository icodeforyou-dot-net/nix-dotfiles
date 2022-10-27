{ config, pkgs, ... }:

{
  programs.eww = {
    enable = false;
    package = pkgs.unstable.eww-wayland;
    # configDir = ./.;
  };
}
