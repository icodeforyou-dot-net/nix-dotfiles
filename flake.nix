{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-21.11";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-21.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
        url = "github:nix-community/neovim-nightly-overlay";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, neovim-nightly-overlay, ... }@inputs: 
    let
      system = "x86_64-linux";
      
      pkgs = import nixpkgs {
        inherit system;
	      config = { allowUnfree = true; };
      };

      lib = nixpkgs.lib;

      overlays = [
        inputs.neovim-nightly-overlay.overlay
        ];

      overlay-neovim = final: prev: {
        neovim = inputs.neovim-nightly-overlay.overlay;
        };

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
	      ];
       };

      archon = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./hosts/shared_configuration.nix
	        ./hosts/archon/configuration.nix
	      ];
       };

     };

     homeConfigurations = {
       ap-proteus = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
	      username = "ap";
	      homeDirectory = "/home/ap";
	      stateVersion = "21.11";
	      configuration = {

          nixpkgs.config = { allowUnfree = true; };
          nixpkgs.overlays = [ overlay-neovim overlay-unstable ];
	   
          imports = [
            ./hosts/proteus/home.nix
          ];
	        };
       };
       ap-archon = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
        username = "ap";
        homeDirectory = "/home/ap";
        stateVersion = "21.11";
        configuration = {
  
          nixpkgs.config = { allowUnfree = true; };
          nixpkgs.overlays = [ overlay-neovim overlay-unstable ];
      
          imports = [
            ./hosts/archon/home.nix
          ];
          };
     };
    };

    };
}
