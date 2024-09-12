{ pkgs, ... }:
{
  home.packages = with pkgs; [
    unstable.atuin
  ];
}
