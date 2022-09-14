{ config, pkgs, inputs, lib, ... }:

{
  programs.eww = {
    enable = true;
    package = unstable.eww-wayland;
    configDir = ./.;
  };
}
