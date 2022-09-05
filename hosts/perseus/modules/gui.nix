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
  wrapped-chromium = with pkgs; (writeShellScriptBin "chromium" ''
    exec firejail ${pkgs.chromium}/bin/chromium
  '');

  wrapped-discord = with pkgs; (writeShellScriptBin "discord" ''
    exec firejail ${pkgs.chromium}/bin/discord
  '');

  wrapped-firefox = with pkgs; (writeShellScriptBin "firefox" ''
    exec firejail ${pkgs.firefox}/bin/firefox
  '');
in
{
  home.packages = with pkgs; [

    unstable.bitwarden
    darktable
    
    # Creating a wrapper for discord to run it in firejail
    (symlinkJoin {
      name = "discord";
      paths = [
        wrapped-discord
        pkgs.discord
        ];
    })

    unstable.element-desktop
    unstable.mailspring


    skypeforlinux

    unstable.signal-desktop
    unstable.tdesktop
    unstable.whatsapp-for-linux
    insomnia
    vlc
    unstable.tutanota-desktop

    calibre

    # Browser
    unstable.brave

    # Creating a wrapper for chromium to run it in firejail
    (symlinkJoin {
      name = "chromium";
      paths = [
        wrapped-chromium
        pkgs.chromium
        ];
    })

    # Creating a wrapper for firefox to run it in firejail
    (symlinkJoin {
      name = "firefox";
      paths = [
        wrapped-firefox
        pkgs.firefox
        ];
    })

    # tor
    unstable.onionshare-gui
    unstable.onionshare
    # unstable.tor-browser-bundle-bin
  ];
}