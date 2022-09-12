{ pkgs, inputs, lib, ... }:
let
  dependencies = with pkgs; [
    bc
    bluez
    coreutils
    findutils
    gawk
    gnused
    jq
    light
    networkmanager
    playerctl
    procps
    ripgrep
    socat
    upower
    wget
    wireplumber
    wofi
  ];
in
{
  home.packages = dependencies;

  programs.eww = {
    enable = true;
    package = unstable.eww-wayland;
    configDir = ./.;
  };
}
