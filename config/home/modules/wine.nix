{ pkgs, ... }:
{
  home.packages = with pkgs; [
    unstable.bottles
    unstable.lutris
    unstable.wine-staging
  ];
}
