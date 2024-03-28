{ config, pkgs, nixpkgs, ... }:

let
  bitwarden-wrapper = with pkgs; (writeShellScriptBin "bitwarden" ''
    exec ${unstable.bitwarden}/bin/bitwarden --disable-gpu
  '');

  wrapped-chromium = with pkgs; (writeShellScriptBin "chromium" ''
    exec firejail ${pkgs.chromium}/bin/chromium
  '');

  wrapped-discord = with pkgs; (writeShellScriptBin "Discord" ''
    exec firejail ${pkgs.discord}/bin/discord --disable-gpu
  '');

  wrapped-firefox = with pkgs; (writeShellScriptBin "firefox" ''
    exec firejail ${pkgs.firefox}/bin/firefox
  '');

  # tutanota-desktop-override = with pkgs; (unstable.tutanota-desktop.overrideAttrs
  #   (oldAttrs: rec {
  #     pname = "tutanota-desktop";
  #     version = "3.118.22";
  #     src = fetchurl {
  #       url = "https://github.com/tutao/tutanota/releases/download/tutanota-desktop-release-${version}/${pname}-${version}-unpacked-linux.tar.gz";
  #       name = "tutanota-desktop-${version}.tar.gz";
  #       sha256 = "hW3Jr0it2MKk0pDk4ytw1sixlAZ/6UhMg6slkmWvRag=";
  #     };
  #   }));
in
{
  home.packages = with pkgs; [

    simp1e-cursor-theme-catppuccin-frappe
    # diogenes-reader
    unstable.galaxy-buds-client

    # pass --disable-gpu to bitwarden desktop via wrapper
    (symlinkJoin {
      name = "bitwarden";
      paths = [
        bitwarden-wrapper
        unstable.bitwarden
      ];
    })

    unstable.darktable

    # thunderbird, tutanota
    unstable.thunderbird
    unstable.tutanota-desktop

    unstable.obs-studio
    unstable.obs-studio-plugins.wlrobs
    # davinci-resolve

    # To-do task manager
    unstable.endeavour

    # Skype, signal, telegram, whatsapp, element, zulip
    skypeforlinux
    unstable.signal-desktop
    unstable.tdesktop
    unstable.whatsapp-for-linux
    # unstable.element-desktop
    unstable.zulip

    # Obsidian
    unstable.obsidian

    # Creating a wrapper for discord to run it in firejail and with --disable-gpu
    (symlinkJoin {
      name = "discord";
      paths = [
        wrapped-discord
        pkgs.discord
      ];
    })

    insomnia
    vlc


    # notetaking app
    unstable.rnote

    # wallpapers from unsplash
    unstable.fondo
    # background sounds
    unstable.blanket
    # Extract text from image
    unstable.gnome-frog

    calibre

    # Brave browser
    unstable.brave

    # icedtea-web Java plugin
    # unstable.adoptopenjdk-icedtea-web

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
    # unstable.onionshare-gui
    # unstable.onionshare
    unstable.tor-browser-bundle-bin

    # Zotero
    unstable.zotero

  ];
}
