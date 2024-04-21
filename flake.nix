{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland/289d424"; #b80c72c #b4f7552 #d87d2da #d87d2da #39a4f82 #2c2e35e #7a775c0 #9370c7a
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    std.url = "github:divnix/std";
    std.inputs.nixpkgs.follows = "nixpkgs";
    std.inputs.devshell.url = "github:numtide/devshell";
    std.inputs.nixago.url = "github:nix-community/nixago";
  };

  outputs = { std, self, nixpkgs, nixpkgs-unstable, home-manager, hyprland, ... }@inputs:
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
    std.growOn
      {
        inherit inputs;
        nixpkgsConfig.allowUnfree = true;
        systems = [ "x86_64-linux" ];
        cellsFrom = ./config/dev;
        cellBlocks = with std.blockTypes; [
          (nixago "configs")
          (devshells "devshells")
        ];
      }
      # std soil for standard nixosConfigs homeConfigs and classical devShells
      {
        nixosConfigurations = {
          archon = lib.nixosSystem {
            inherit system;
            modules = [
              ./config/hosts/archon-system.nix
              {
                nix.registry.nixpkgs.flake = nixpkgs;
                nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
                nix.settings.trusted-users = [ "root" "@wheel" ];
              }
              {
                nixpkgs.overlays = [ overlay-unstable overlay-custom ];
              }
            ];
          };

          perseus = lib.nixosSystem {
            inherit system;
            modules = [
              ./config/hosts/perseus-system.nix
              {
                nix.registry.nixpkgs.flake = nixpkgs;
                nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
                nix.settings.trusted-users = [ "root" "@wheel" ];
              }
              { nixpkgs.overlays = [ overlay-unstable overlay-custom ]; }
            ];
          };

          cadmus = lib.nixosSystem {
            inherit system;
            modules = [
              ./config/hosts/cadmus-system.nix
              {
                nix.registry.nixpkgs.flake = nixpkgs;
                nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
                nix.settings.trusted-users = [ "root" "@wheel" ];
              }
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
                nixpkgs.overlays = [ overlay-unstable overlay-custom ];
              }
              ./config/hosts/perseus-home.nix
            ];
          };

          ap-cadmus = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              {
                nixpkgs.overlays = [ overlay-unstable overlay-custom ];
              }
              ./config/hosts/cadmus-home.nix
            ];
          };
        };
      };
}
