# Overriding the alacritty package installed via home-manager
{ config, pkgs, nixpkgs, ... }:
{
  home.packages = with pkgs; [
    #Creating a wrapper for alacritty to run it in XWayland
    (symlinkJoin {
      paths = [ alacritty ];
      inherit (alacritty) name pname version;
      nativeBuildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/alacritty \
          --set WAYLAND_DISPLAY alacritty
      '';
    })
  ];
}
