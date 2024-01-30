{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Diablo I
    unstable.devilutionx
  ];
}
