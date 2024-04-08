{ config, pkgs, ... }:
let
  my-kubernetes-helm = with pkgs.unstable; wrapHelm kubernetes-helm {
    plugins = with pkgs.unstable.kubernetes-helmPlugins; [
      helm-secrets
      helm-diff
      helm-s3
      helm-git
    ];
  };

  my-helmfile = with pkgs.unstable; helmfile-wrapped.override {
    inherit (my-kubernetes-helm.passthru) pluginsDir;
  };

  kubectl-v1-24-16 = with pkgs.unstable; (kubectl.overrideAttrs (
    (oldAttrs: rec {
      version = "1.24.16";

      src = fetchFromGitHub {
        owner = "kubernetes";
        repo = "kubernetes";
        rev = "v${version}";
        hash = "sha256-rZtcCmDxpAN8zL4D0xGRC6yiEk65fHYADQjFN/HLLJU=";
      };
    })
  ));
in

{
  home.packages = with pkgs; [

    # general
    unstable.git
    unstable.github-desktop
    # gittyup

    # C
    unstable.gcc

    # lua
    lua
    unstable.stylua

    # markdown
    # nodePackages.livedown
    pandoc

    # Nix
    unstable.nixpkgs-fmt
    unstable.nixfmt
    unstable.alejandra
    unstable.nil

    # python
    # (python3.withPackages (ps: with ps; [ setuptools pip debugpy ]))

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

    # kubernetes helm with plugins, helmfile & kompose
    unstable.kompose
    # (unstable.wrapHelm unstable.kubernetes-helm {
    #   plugins = [
    #     unstable.kubernetes-helmPlugins.helm-secrets
    #     unstable.kubernetes-helmPlugins.helm-diff
    #     unstable.kubernetes-helmPlugins.helm-s3
    #   ];
    # })
    # unstable.helmfile
    my-kubernetes-helm
    my-helmfile


    # kubernetes cli tools
    kubectl
    # kubectl-v1-24-16
    unstable.argocd
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
