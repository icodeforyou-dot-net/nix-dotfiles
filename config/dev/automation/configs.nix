let
  inherit (inputs) nixpkgs;
  inherit (inputs.std.dmerge) append;
  inherit (inputs.std.data) configs;
  inherit (inputs.std.lib.dev) mkNixago;
in
{
  treefmt = (mkNixago configs.treefmt) {
    data.formatter.prettier = {
      excludes = [
        "./package.json"
        "./pnpm-lock.yaml"
      ];
      includes = append [ "*.mjs" ];
    };
    data.formatter.nix = {
      command = "nixpkgs-fmt";
    };
  };
  editorconfig = (mkNixago configs.editorconfig) { };
  conform = (mkNixago configs.conform) { };
  lefthook = (mkNixago configs.lefthook) { };

  cog = (mkNixago configs.cog) {
    data.changelog = {
      remote = "github.com";
      repository = "nix-dotfiles";
      owner = "icodeforyou-dot-net";
    };
  };

  githubsettings = (mkNixago configs.githubsettings) {
    data = {
      repository = {
        name = "nix-dotfiles";
        description = "WIP";
        topics = "Nix, NixOS";
        default_branch = "main";
        allow_squash_merge = true;
        allow_merge_commit = false;
        allow_rebase_merge = true;
        delete_branch_on_merge = true;
      };
      milestones = [
        {
          title = "Work in progress!";
          description = ":dart:";
          state = "open";
        }
      ];
    };
  };
}
