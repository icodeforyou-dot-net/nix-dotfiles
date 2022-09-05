{ config, pkgs, nixpkgs, ... }:

let
  # tutanota-desktop-override = with pkgs; (unstable.tutanota-desktop.overrideAttrs
  #   (oldAttrs: rec {
  #     pname = "tutanota-desktop";
  #     version = "3.98.15";
  #     src = fetchurl {
  #       url = "https://github.com/tutao/tutanota/releases/download/tutanota-desktop-release-${version}/${pname}-${version}-unpacked-linux.tar.gz";
  #       name = "tutanota-desktop-${version}.tar.gz";
  #       sha256 = "sha256-yuSFDLQ7ckuZYuXREbW0VvMapzO2VhVIH1Ccr1uQHmo=";
  #     };
  #   }));
in
{
  home.packages = with pkgs; [

    unstable.mailspring
    discord
    unstable.element-desktop
    skypeforlinux
    unstable.bitwarden
    unstable.signal-desktop
    unstable.tdesktop
    unstable.whatsapp-for-linux
    insomnia
    vlc
    darktable
    unstable.tutanota-desktop

    calibre

    # Browser
    chromium
    unstable.brave
    unstable.firefox

    # tor
    unstable.onionshare-gui
    unstable.onionshare
    unstable.tor-browser-bundle-bin
  ];
}