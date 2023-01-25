{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";

    nixpkgs-22-05.url = "nixpkgs/nixos-22.05";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland/d87d2da"; #d87d2da #39a4f82 #2c2e35e #7a775c0 #9370c7a
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { nixpkgs, nixpkgs-22-05, nixpkgs-unstable, home-manager, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      pkgs-22-05 = import nixpkgs-22-05 {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      lib = nixpkgs.lib;

      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };

      overlay-22-05 = final: prev: {
        unstable = import nixpkgs-22-05 {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };

      overlay-custom-kernel = import ./config/sys/modules/kernels/custom-kernels/kernel-5.16.9-source-tree-overlay.nix;

      overlay-custom = import ./packages;

    in
    {
      nixosConfigurations = {
        archon = lib.nixosSystem {
          inherit system;
          modules = [
            ./config/hosts/archon-system.nix
            { nix.registry.nixpkgs.flake = nixpkgs; }
            { nix.nixPath = [ "nixpkgs=${nixpkgs}" ]; }
            {
              nixpkgs.overlays = [
                overlay-unstable
                overlay-22-05
                overlay-custom
                overlay-custom-kernel
              ];
            }
          ];
        };

        perseus = lib.nixosSystem {
          inherit system;
          modules = [
            hyprland.nixosModules.default
            {
              programs.hyprland = {
                enable = true;
                package = inputs.hyprland.packages.${pkgs.system}.default.overrideAttrs (old: {
                  nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.makeWrapper ];
                  postInstall = ''
                    wrapProgram $out/bin/Hyprland \
                      --set NIXOS_OZONE_WL 1 \
                      --set GDK_BACKEND wayland \
                      --set _JAVA_AWT_WM_NONREPARENTING 1 \
                      --set XDG_SESSION_TYPE wayland
                  '';
                });
                recommendedEnvironment = false;
              };
            }
            ./config/hosts/perseus-system.nix
            { nix.registry.nixpkgs.flake = nixpkgs; }
            { nix.nixPath = [ "nixpkgs=${nixpkgs}" ]; }
            { nixpkgs.overlays = [ overlay-unstable overlay-custom ]; }
          ];
        };

        cadmus = lib.nixosSystem {
          inherit system;
          modules = [
            hyprland.nixosModules.default
            {
              programs.hyprland = {
                enable = true;
                package = inputs.hyprland.packages.${pkgs.system}.default.overrideAttrs (old: {
                  nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.makeWrapper ];
                  postInstall = ''
                    wrapProgram $out/bin/Hyprland \
                      --set NIXOS_OZONE_WL 1 \
                      --set GDK_BACKEND wayland \
                      --set _JAVA_AWT_WM_NONREPARENTING 1 \
                      --set XDG_SESSION_TYPE wayland
                  '';
                });
                recommendedEnvironment = false;
              };
            }
            ./config/hosts/cadmus-system.nix
            { nix.registry.nixpkgs.flake = nixpkgs; }
            { nix.nixPath = [ "nixpkgs=${nixpkgs}" ]; }
            { nixpkgs.overlays = [ overlay-unstable overlay-custom ]; }
          ];
        };

      };

      homeConfigurations = {

        ap-archon = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              nixpkgs.overlays = [ overlay-unstable overlay-custom ];
            }
            ./config/hosts/archon-home.nix
          ];
        };

        ap-perseus = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              # home = {
              #   username = "ap";
              #   homeDirectory = "/home/ap";
              #   stateVersion = "22.11";
              # };
              # nixpkgs.config = { allowUnfree = true; };
              nixpkgs.overlays = [ overlay-unstable overlay-custom ];
            }
            ./config/hosts/perseus-home.nix
          ];
        };

        ap-cadmus = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              # home = {
              #   username = "ap";
              #   homeDirectory = "/home/ap";
              #   stateVersion = "22.11";
              # };
              # nixpkgs.config = { allowUnfree = true; };
              nixpkgs.overlays = [ overlay-unstable overlay-custom ];
            }
            ./config/hosts/cadmus-home.nix
          ];
        };
      };
    };
}
