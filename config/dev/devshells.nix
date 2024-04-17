let
  inherit (inputs.nixpkgs) pkgs;
  inherit (inputs.std) std;
  inherit (inputs.std.lib) dev;
  inherit (cell) configs;
in
{
  default = dev.mkShell {
    name = "nix devShell";
    imports = [ std.devshellProfiles.default ];
    commands = [
      { package = pkgs.nil; }
      { package = pkgs.nixpkgs-fmt; }
      { package = pkgs.sops; }
      { package = pkgs.rage; }
    ];
    nixago = [
      configs.conform
      configs.treefmt
      configs.editorconfig
      configs.githubsettings
      configs.lefthook
      configs.cog
    ];
  };
}
