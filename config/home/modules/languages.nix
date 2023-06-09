{ config, pkgs, ... }:

{
  home.packages = with pkgs; [

    # general
    unstable.git
    #unstable.github-desktop
    gittyup

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
    unstable.alejandra
    dconf2nix
    rnix-lsp

    # python
    (python3.withPackages (ps: with ps; [ setuptools pip debugpy ]))

    lldb # debugging setup

    # Containers
    dive
    skopeo

    # ansible
    unstable.ansible
    unstable.ansible-lint
    sshpass

    # VMs
    quickemu
    vagrant

    # distrobox
    unstable.distrobox

    # kubernetes
    unstable.minikube
    unstable.kube3d
    unstable.kind

    # kubernetes helm & kompose
    unstable.kompose
    unstable.kubernetes-helm
    unstable.kubernetes-helmPlugins.helm-diff
    unstable.helmfile

    # kubernetes cli tools
    unstable.argocd
    unstable.kubectl
    unstable.kubectx
    unstable.kubecfg
    unstable.kubie
    unstable.k9s
    unstable.stern

  ];


  programs.go = {
    enable = true;
  };

}
