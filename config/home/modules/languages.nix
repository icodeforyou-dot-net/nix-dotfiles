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
    unstable.stylua

    # markdown
    # nodePackages.livedown
    pandoc

    # Nix
    nixpkgs-fmt
    dconf2nix
    rnix-lsp

    # python
    (python3.withPackages (ps: with ps; [ setuptools pip debugpy ]))

    lldb # debugging setup

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
    unstable.distrobox
  ];


  programs.go = {
    enable = true;
  };

}
