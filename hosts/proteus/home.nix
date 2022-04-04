{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "Iosevka" "Overpass" ]; })

  # GUI Apps
  unstable.mailspring
  slack
  unstable.discord
  element-desktop
  skypeforlinux
  unstable.bitwarden
  unstable.signal-desktop
  unstable.tdesktop
  unstable.whatsapp-for-linux
  insomnia
  vlc
  pcmanfm
  lxappearance
  gimp
  darktable
  inkscape
  pdfarranger
  unstable.onlyoffice-bin
  zoom-us
  tutanota-desktop
  calibre
  koreader

  # Gaming
  dosbox-staging

  # Browser
  chromium
  brave
  lagrange

  # tor
  unstable.onionshare-gui
  unstable.onionshare
  unstable.tor-browser-bundle-bin

  #
  pciutils
  usbutils
  less
  stress

  openvpn
  gnome3.networkmanager-openvpn
   
  # CLI tools
  awscli
  ngrok
  gnumake
  docker-compose
  tokei
  ranger
  ncdu
  xz
  youtube-dl
  unrar
  unstable.helix

  # Shell
  starship
  zsh-syntax-highlighting

  # Searching/Movement helpers
  fzf
  exa
  zoxide
  ripgrep
  universal-ctags
  du-dust
  duf

  # system info
  bottom
  neofetch
  
  # GNOME stuff
  gnome.gnome-tweaks
  gnome.networkmanager-openvpn
  unstable.gnomeExtensions.dash-to-dock
  gnomeExtensions.tweaks-in-system-menu
  gnomeExtensions.gnome-vagrant-indicator
  flat-remix-gtk
  flat-remix-icon-theme
  papirus-icon-theme
  nordic
  tela-icon-theme
  lyrebird

  # Android
  android-file-transfer

  # Audio
  pavucontrol

  # Coding

  # general
  git
  github-desktop

  # C
  gcc

  # go
  go

  # Haskell
  ghc
  haskellPackages.cabal-install
  haskellPackages.stack

  # JavaScript
  nodejs
  yarn

  # lua
  lua

  # markdown
  nodePackages.livedown
  pandoc

  # Nix
  dconf2nix

  # python
  (python3.withPackages (ps: with ps; [ setuptools pip debugpy requests ]))
  poetry
  autoflake
  black
  python3Packages.ipython
  python3Packages.ipykernel
  python3Packages.parso
  python3Packages.twine

  # rust
  rustup

  lldb # debugging setup

  # Containers
  dive
  skopeo

  #SQL
  unstable.sqlitebrowser
  unstable.beekeeper-studio
  # unstable.pgadmin

  # ansible
  ansible
  ansible-lint
  sshpass

  # VMs
  quickemu
  vagrant
  ];
}
