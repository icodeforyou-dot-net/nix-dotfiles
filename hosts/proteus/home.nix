{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "Iosevka" "Overpass" "FiraCode" ]; })

  # GUI Apps
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
  unstable.asciinema
  unstable.moc
  unstable.havoc
    
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
  unstable.git
  unstable.github-desktop

  # C
  unstable.gcc

  # lua
  lua

  # markdown
  # nodePackages.livedown
  pandoc

  # Nix
  dconf2nix
  rnix-lsp

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
    
  # Julia
  unstable.julia-bin
    
  # Containers
  dive
  skopeo

  #SQL
  unstable.sqlitebrowser
  unstable.beekeeper-studio

  # ansible
  ansible
  ansible-lint
  sshpass

  # VMs
  quickemu
  vagrant
  ];

  xresources.properties = {
    "Xft.dpi" = 192;
    "Xft.antialias" = true;
    "Xft.autohint" = false;
    "Xft.lcdfilter" = "lcddefault";
    "Xft.hintsyle" = "hintful";
    "URxvt.foreground" = "White";
  };
}