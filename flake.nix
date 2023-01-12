{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";

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

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
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

      overlay-custom = import ./packages;

    in
    {
      nixosConfigurations = {
        archon = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/shared_configuration.nix
            ./hosts/archon/configuration.nix
            #./hosts/kernels/kernel-5.16.9.nix
            ./hosts/kernels/linuxPackages_latest.nix
            { nix.registry.nixpkgs.flake = nixpkgs; }
            { nix.nixPath = [ "nixpkgs=${nixpkgs}" ]; }
            { nixpkgs.overlays = [ overlay-unstable overlay-custom ]; }
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
            ./hosts/shared_configuration.nix
            ./hosts/perseus/configuration.nix
            ./hosts/perseus/hostname.nix
            ./hosts/perseus/hardware-configuration.nix
            ./hosts/kernels/linuxPackages_latest.nix
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
            ./hosts/shared_configuration.nix
            ./hosts/perseus/configuration.nix
            ./hosts/cadmus/hostname.nix
            ./hosts/cadmus/hardware-configuration.nix
            ./hosts/kernels/linuxPackages_latest.nix
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
              home = {
                username = "ap";
                homeDirectory = "/home/ap";
                stateVersion = "22.11";
              };
              nixpkgs.config = { allowUnfree = true; };
              nixpkgs.overlays = [ overlay-unstable overlay-custom ];
            }
            ./hosts/shared_home.nix
            ./hosts/home_modules/games/openmw.nix
            ./hosts/home_modules/audio.nix
            ./hosts/home_modules/cli-os.nix
            ./hosts/home_modules/coding.nix
            ./hosts/home_modules/fonts.nix
            ./hosts/home_modules/gnome.nix
            ./hosts/home_modules/gui.nix
            ./hosts/archon/home.nix
          ];
        };

        ap-perseus = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              home = {
                username = "ap";
                homeDirectory = "/home/ap";
                stateVersion = "22.11";
              };
              nixpkgs.config = { allowUnfree = true; };
              nixpkgs.overlays = [ overlay-unstable overlay-custom ];
            }
            ./config/home/modules/home_manager.nix
            ./config/home/modules/cli-os.nix
            ./config/home/modules/editors.nix
            ./config/home/modules/eww/eww.nix
            ./config/home/modules/mako/mako.nix
            ./config/home/modules/languages.nix
            ./config/home/modules/fonts.nix
            ./config/home/modules/gnome.nix
            ./config/home/modules/gui.nix
            ./config/home/modules/swaylock.nix
            ./config/home/modules/wayland.nix
            ./config/home/modules/xresources.nix
          ];
        };

        ap-cadmus = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              home = {
                username = "ap";
                homeDirectory = "/home/ap";
                stateVersion = "22.11";
              };
              nixpkgs.config = { allowUnfree = true; };
              nixpkgs.overlays = [ overlay-unstable overlay-custom ];
            }
            ./config/home/modules/home_manager.nix
            ./config/home/modules/cli-os.nix
            ./config/home/modules/editors.nix
            ./config/home/modules/eww/eww.nix
            ./config/home/modules/mako/mako.nix
            ./config/home/modules/languages.nix
            ./config/home/modules/fonts.nix
            ./config/home/modules/gnome.nix
            ./config/home/modules/gui.nix
            ./config/home/modules/swaylock.nix
            ./config/home/modules/wayland.nix
            ./config/home/modules/xresources.nix
          ];
        };
      };
    };
}
