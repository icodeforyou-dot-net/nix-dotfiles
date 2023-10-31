{ config, pkgs, nixpkgs, ... }:

let
  element-desktop-wrapped = with pkgs; (writeShellScriptBin "element-desktop" ''
    env WAYLAND_DISPLAY= ${unstable.element-desktop}/bin/element-desktop --disable-gpu
  '');
in

{
  home.packages = with pkgs; [
    element-desktop-wrapped
  ];
}
