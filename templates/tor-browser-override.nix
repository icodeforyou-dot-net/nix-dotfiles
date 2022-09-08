  # Overriding the tutanota package installed via home-manager
  { config, pkgs, nixpkgs, ... }:
  
  let
  tor-browser-bundle-bin-override = with pkgs; (unstable.tor-browser-bundle-bin.overrideAttrs
    (oldAttrs: rec {
      version = "11.5.1-11.5.2";
      srcs = {
        x86_64-linux = fetchurl {
          urls = [
            "https://dist.torproject.org/torbrowser/${version}/tor-browser-linux64-${version}_${lang}.tar.xz"
            "https://tor.eff.org/dist/torbrowser/${version}/tor-browser-linux64-${version}_${lang}.tar.xz"
            "https://tor.calyxinstitute.org/dist/torbrowser/${version}/tor-browser-linux64-${version}_${lang}.tar.xz"
          ];
          sha256 = "sha256-LgzvptQoTHGngW4xDZNfm5teSjpAjcUzMKDbBHRInoo=";
        };
      };
    }));
in
{
  home.packages = with pkgs; [
    tor-browser-bundle-bin-override
  ];
}