{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  pciutils
  usbutils
  less
  stress
  starship

  fzf
  exa
  zoxide
  ripgrep
  universal-ctags
  du-dust
  duf

  awscli
  kaggle
  ngrok
  gnumake
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
  unstable.tiny

  bottom
  neofetch

  android-file-transfer
  ];
}