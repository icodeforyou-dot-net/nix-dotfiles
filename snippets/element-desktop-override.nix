{ config, pkgs, nixpkgs, ... }:

let
  element-desktop-override = with pkgs; (unstable.element-desktop.overrideAttrs
    (oldAttrs: rec {
      pname = "element-desktop";
    }));
in

{
  home.packages = with pkgs; [
    element-desktop-override
  ];
}
