{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    
  # Coding
  unstable.helix

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

  # Configuration for helix editor
  home.file.".config/helix/config.toml" = {
        executable = false;
        text = ''
        theme = "nord"

        [editor]
        line-number = "absolute"
        mouse = true
        scrolloff = 2

        [editor.file-picker]
        hidden = false

        [keys.normal]
        g = { a = "code_action" } # Maps `ga` to show possible code actions
        C-c = "no_op"
        "C-/" = "toggle_comments"

        [keys.insert]
        j = { k = "normal_mode" } # Maps `jk` to exit insert mode
        C-c = "normal_mode"
        
        [keys.select]
        '';
  };

  programs.go = {
      enable = true;
    };

  programs.neovim = {
      enable = true;
      package = pkgs.unstable.neovim-unwrapped;
    };

  programs.vscode = {
     enable = true;
     package = pkgs.unstable.vscode;
     extensions = with pkgs; [
      vscode-extensions.pkief.material-icon-theme
      vscode-extensions.arcticicestudio.nord-visual-studio-code
      unstable.vscode-extensions.bbenoist.nix
      unstable.vscode-extensions.jnoortheen.nix-ide
      unstable.vscode-extensions.arrterian.nix-env-selector
      unstable.vscode-extensions.haskell.haskell
      unstable.vscode-extensions.ms-vscode.cpptools
      vscode-extensions.graphql.vscode-graphql
      unstable.vscode-extensions.ms-python.python
      unstable.vscode-extensions.ms-python.vscode-pylance
      unstable.vscode-extensions.ms-toolsai.jupyter
      vscode-extensions.ms-azuretools.vscode-docker
      unstable.vscode-extensions.matklad.rust-analyzer
      vscode-extensions.ms-vscode-remote.remote-ssh
      vscode-extensions.redhat.vscode-yaml
      vscode-extensions.svelte.svelte-vscode ];
    };
}