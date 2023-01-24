{ pkgs, ... }:

{
  boot.kernelPackages =
    let
      linux_pkg = { fetchurl, buildLinux, ... } @ args:

        buildLinux (args // rec {
          version = "5.16.10";
          modDirVersion = version;

          src = "file://";

          kernelPatches = [ ];

          extraMeta.branch = "5.16";
        } // (args.argsOverride or { }));
      linux_5-16-10 = pkgs.callPackage linux_pkg { };
    in
    pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_5-16-10);
}
