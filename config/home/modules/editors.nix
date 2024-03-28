{ config
, pkgs
, ...
}:
let
  vscode-override = with pkgs; (unstable.vscode.overrideAttrs
    (oldAttrs: rec {
      desktopItem = oldAttrs.desktopItem.override {
        mimeTypes = [ "text/plain" ];
      };

      preFixup =
        oldAttrs.preFixup
        + ''

          gappsWrapperArgs+=(
            --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--disable-gpu}}"
          )
        '';
    }));
in
{
  home.packages = with pkgs; [
    # Coding
    unstable.helix

    #SQL
    unstable.sqlitebrowser
    unstable.beekeeper-studio
  ];

  # Configuration for helix editor
  home.file.".config/helix/config.toml" = {
    executable = false;
    text = ''
      theme = "catppuccin_mocha"

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

  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
  };

  programs.vscode = {
    enable = true;
    package = vscode-override;

    extensions = with pkgs; [
      unstable.vscode-extensions.pkief.material-icon-theme
      unstable.vscode-extensions.catppuccin.catppuccin-vsc

      unstable.vscode-extensions.bbenoist.nix
      unstable.vscode-extensions.jnoortheen.nix-ide
      unstable.vscode-extensions.b4dm4n.vscode-nixpkgs-fmt
      unstable.vscode-extensions.kamadorueda.alejandra

      unstable.vscode-extensions.haskell.haskell
      unstable.vscode-extensions.astro-build.astro-vscode
      # unstable.vscode-extensions.ms-vscode.cpptools
      # unstable.vscode-extensions.ms-python.python
      unstable.vscode-extensions.ms-python.vscode-pylance
      unstable.vscode-extensions.ms-toolsai.jupyter
      # unstable.vscode-extensions.ms-azuretools.vscode-docker
      unstable.vscode-extensions.matklad.rust-analyzer
      unstable.vscode-extensions.ms-vscode-remote.remote-ssh
      unstable.vscode-extensions.redhat.vscode-yaml
      unstable.vscode-extensions.tamasfe.even-better-toml

      # Llama Coder extension not yet in nixpkgs
      # (unstable.vscode-utils.buildVscodeMarketplaceExtension {
      #   mktplcRef = {
      #     name = "llama-coder";
      #     publisher = "ex3ndr";
      #     version = "0.0.13";
      #     sha256 = "sha256-xdM2zLIO4ydGt4M1hDDXEqQgXK2LYBRwOS5QfvG+aQ4=";
      #     arch = "linux-x64";
      #   };
      #   nativeBuildInputs = [
      #     pkgs.autoPatchelfHook
      #   ];
      #   buildInputs = [ pkgs.stdenv.cc.cc.lib ];
      # })

      # OpenTofu
      # (unstable.vscode-utils.buildVscodeMarketplaceExtension {
      #   mktplcRef = {
      #     name = "opentofu";
      #     publisher = "gamunu";
      #     version = "0.1.1";
      #     sha256 = "sha256-JgNU7GinMsRhM9zM1AXRZWD8y/pF53I7pmTx0MmQ+o8=";
      #     arch = "linux-x64";
      #   };

      #   patches = [ ./patches/fix-terraform-ls.patch ];

      #   postPatch = ''
      #     substituteInPlace out/serverPath.js --replace TERRAFORM-LS-PATH ${terraform-ls}/bin/terraform-ls
      #   '';

      #   meta = {
      #     license = lib.licenses.mit;
      #     maintainers = [ lib.maintainers.rhoriguchi ];
      #   };
      # })

      # Continue.dev extension not yet in nixpkgs
      (unstable.vscode-utils.buildVscodeMarketplaceExtension {
        mktplcRef = {
          name = "continue";
          publisher = "Continue";
          version = "0.9.67";
          sha256 = "sha256-xdM2zLIO4ydGt4M1hDDXEqQgXK2LYBRwOS5QfvG+aQ4=";
          arch = "linux-x64";
        };

        nativeBuildInputs = [
          pkgs.autoPatchelfHook
        ];

        buildInputs = [ pkgs.stdenv.cc.cc.lib ];

        postInstall = ''
          cd "$out/$installPrefix"
          substituteInPlace "out/extension.js" \
            --replace 'await showTutorial();' '//await showTutorial();'
        '';
      })
    ];

    userSettings = {
      "continue.telemetryEnabled" = false;
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "editor.fontFamily" = "'JetBrains Mono Nerd Font', monospace";
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "extensions.autoUpdate" = false;
      "extensions.autoCheckUpdates" = false;
      "[nix]"."editor.defaultFormatter" = "B4dM4n.nixpkgs-fmt";
      "[nix]"."editor.tabSize" = 2;
      "python.formatting.provider" = "black";
      "python.linting.enabled" = true;
      "python.linting.flake8Enabled" = true;
      "python.linting.flake8Args" = [
        "--max-line-length=120"
        "--ignore=E402,F841,F401,E302,E305"
      ];
      "python.linting.lintOnSave" = true;
      "python.linting.mypyEnabled" = true;
      "python.linting.mypyArgs" = [
        "--ignore-missing-imports"
        "--follow-imports=silent"
        "--show-column-numbers"
        "--strict"
      ];
      "python.linting.pylintEnabled" = true;
      "python.linting.pylintArgs" = [
        "--disable=missing-module-docstring"
        "--disable=missing-class-docstring"
        "--disable=missing-function-docstring"
      ];
      "redhat.telemetry.enabled" = false;
      "telemetry.telemetryLevel" = "off";
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
      "update.mode" = "none";
      "window.zoomLevel" = 1;
      "window.menuBarVisibility" = "toggle";
    };
  };
}
