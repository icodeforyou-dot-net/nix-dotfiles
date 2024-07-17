{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nerd-dictation
    unstable.dotool
  ];
}
