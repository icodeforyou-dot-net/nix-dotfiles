{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    
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

  # rust
  rustup

  lldb # debugging setup
    
  # Julia
  unstable.julia-bin
    
  # Containers
  dive
  skopeo
  docker-compose

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
}