{ config, pkgs, nixpkgs, ... }:

let
  element-desktop-override = with pkgs; (unstable.element-desktop.overrideAttrs
    (oldAttrs: rec {
      pname = "element-desktop";
      version = "3.118.22";
      src = fetchurl {
        url = "https://github.com/tutao/tutanota/releases/download/tutanota-desktop-release-${version}/${pname}-${version}-unpacked-linux.tar.gz";
        name = "tutanota-desktop-${version}.tar.gz";
        sha256 = "hW3Jr0it2MKk0pDk4ytw1sixlAZ/6UhMg6slkmWvRag=";
      };
    }));
in

{
  home.packages = with pkgs; [
    element-desktop-override
  ];
}
