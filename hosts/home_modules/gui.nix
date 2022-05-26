

{ config, pkgs, ... }:

{
  home.packages = with pkgs; [

  unstable.mailspring
  slack
  unstable.discord
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
  unstable.tutanota-desktop
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
  unstable.tor-browser-bundle-bin
];
}