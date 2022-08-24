{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.05";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland = {
    #   url = "github:hyprwm/Hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
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


    in
    {
      nixosConfigurations = {

        proteus = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/shared_configuration.nix
            ./hosts/proteus/configuration.nix
            ./hosts/system_modules/pipewire.nix
            { nix.registry.nixpkgs.flake = nixpkgs; }
            { nix.nixPath = [ "nixpkgs=${nixpkgs}" ]; }
          ];
        };

        archon = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/shared_configuration.nix
            ./hosts/archon/configuration.nix
            ./hosts/kernels/kernel-5.16.9.nix
            { nix.registry.nixpkgs.flake = nixpkgs; }
            { nix.nixPath = [ "nixpkgs=${nixpkgs}" ]; }
          ];
        };

      };

      homeConfigurations = {
        ap-proteus = home-manager.lib.homeManagerConfiguration {
          inherit system pkgs;
          username = "ap";
          homeDirectory = "/home/ap";
          stateVersion = "22.05";
          configuration = {

            nixpkgs.config = { allowUnfree = true; };
            nixpkgs.overlays = [ overlay-unstable ];

            imports = [
              ./hosts/shared_home.nix
              ./hosts/home_modules/cli-os.nix
              ./hosts/home_modules/coding.nix
              ./hosts/home_modules/fonts.nix
              ./hosts/home_modules/gnome.nix
              ./hosts/home_modules/gui.nix
              ./hosts/proteus/home.nix
            ];
          };
        };
        ap-archon = home-manager.lib.homeManagerConfiguration {
          inherit system pkgs;
          username = "ap";
          homeDirectory = "/home/ap";
          stateVersion = "22.05";
          configuration = {

            nixpkgs.config = { allowUnfree = true; };
            nixpkgs.overlays = [ overlay-unstable ];

            imports = [
              ./hosts/shared_home.nix
              ./hosts/home_modules/audio.nix
              ./hosts/home_modules/cli-os.nix
              ./hosts/home_modules/coding.nix
              ./hosts/home_modules/fonts.nix
              ./hosts/home_modules/gaming/dosbox.nix
              ./hosts/home_modules/gaming/openmw.nix
              ./hosts/home_modules/gnome.nix
              ./hosts/home_modules/gui.nix
              ./hosts/archon/home.nix
            ];
          };
        };
      };

    };
}
