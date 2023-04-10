{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # tenacity, a fork of audacity
    unstable.tenacity

    # Ardour DAW
    unstable.arbour
  ];
}
