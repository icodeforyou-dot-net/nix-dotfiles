# Overriding the tutanota package installed via home-manager
{ config, pkgs, nixpkgs, ... }:
{
  home.packages = with pkgs; [
    #Creating a wrappter for alacritty to run it in XWayland
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