{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (unstable.element-desktop.override { electron = pkgs.electron_28; })
  ];
}
