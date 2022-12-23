{ config, pkgs, ... }:

{
  home.packages = with pkgs; [

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
    nixpkgs-fmt
    dconf2nix
    rnix-lsp

    # python
    (python3.withPackages (ps: with ps; [ setuptools pip debugpy requests ]))

    # rust
    rustup

    lldb # debugging setup

    # Julia
    # unstable.julia-bin

    # Containers
    dive
    skopeo

    # ansible
    ansible
    ansible-lint
    sshpass

    # VMs
    quickemu
    vagrant
  ];


  programs.go = {
    enable = true;
  };

}
