{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-22-05.url = "nixpkgs/nixos-22.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland/289d424"; #b80c72c #b4f7552 #d87d2da #d87d2da #39a4f82 #2c2e35e #7a775c0 #9370c7a
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

      overlay-custom = import ./packages;

      overlay-nerd-dictation = import ./packages/nerd-dictation-vosk;

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
                overlay-custom
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
                package = hyprland.packages.${pkgs.system}.default.overrideAttrs (old: {
                  nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.makeWrapper ];
                  postInstall = ''
                    wrapProgram $out/bin/Hyprland \
                      --set NIXOS_OZONE_WL 1 \
                      --set GDK_BACKEND wayland \
                      --set _JAVA_AWT_WM_NONREPARENTING 1 \
                      --set XDG_SESSION_TYPE wayland
                  '';
                });
              };
              environment.sessionVariables.NIXOS_OZONE_WL = "0";
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
                package = hyprland.packages.${pkgs.system}.default.overrideAttrs (old: {
                  nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.makeWrapper ];
                  postInstall = ''
                    wrapProgram $out/bin/Hyprland \
                      --set NIXOS_OZONE_WL 1 \
                      --set GDK_BACKEND wayland \
                      --set _JAVA_AWT_WM_NONREPARENTING 1 \
                      --set XDG_SESSION_TYPE wayland
                  '';
                });
              };
              environment.sessionVariables.NIXOS_OZONE_WL = "0";
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
              nixpkgs.overlays = [ overlay-unstable overlay-custom overlay-nerd-dictation ];
            }
            ./config/hosts/archon-home.nix
          ];
        };

        ap-perseus = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              nixpkgs.overlays = [ overlay-unstable overlay-custom overlay-nerd-dictation ];
            }
            ./config/hosts/perseus-home.nix
          ];
        };

        ap-cadmus = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              nixpkgs.overlays = [ overlay-unstable overlay-custom overlay-nerd-dictation ];
            }
            ./config/hosts/cadmus-home.nix
          ];
        };
      };
    };
}
