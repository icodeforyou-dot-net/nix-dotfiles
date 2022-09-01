{ config, pkgs, nixpkgs, ... }:

let
  tutanota-desktop-override = with pkgs; (unstable.tutanota-desktop.overrideAttrs
    (oldAttrs: rec {
      pname = "tutanota-desktop";
      version = "3.98.15";
      src = fetchurl {
        url = "https://github.com/tutao/tutanota/releases/download/tutanota-desktop-release-${version}/${pname}-${version}-unpacked-linux.tar.gz";
        name = "tutanota-desktop-${version}.tar.gz";
        sha256 = "sha256-yuSFDLQ7ckuZYuXREbW0VvMapzO2VhVIH1Ccr1uQHmo=";
      };
    }));
in
{
  home.packages = with pkgs; [

    unstable.mailspring
    slack
    discord
    unstable.element-desktop
    skypeforlinux
    unstable.bitwarden
    unstable.signal-desktop
    unstable.tdesktop
    unstable.whatsapp-for-linux
    insomnia
    vlc
    gimp-with-plugins
    darktable
    inkscape
    pdfarranger
    unstable.onlyoffice-bin
    zoom-us
    tutanota-desktop-override

    calibre
    unstable.obsidian

    # Handwritng
    write_stylus
    xournalpp

    # Browser
    chromium
    brave
    lagrange

    # tor
    unstable.onionshare-gui
    unstable.onionshare
    # unstable.tor-browser-bundle-bin
  ];
}
