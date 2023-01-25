{ pkgs, ... }:

{
  boot.kernelPackages =
    let
      linux_pkg = { fetchgit, buildLinux, ... } @ args:

        buildLinux (args // rec {
          version = "5.16.9";
          modDirVersion = version;

          src = fetchgit
            {
              url = "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/";
              rev = "0398436";
              sha256 = "Dz+CpecLcVU/jA00gCnOenDhL8yYzMxM58uCXcTtzj0=";
            };

          kernelPatches = [ ];

          extraMeta.branch = "5.16";
        } // (args.argsOverride or { }));
      linux_5-16-9 = pkgs.callPackage linux_pkg { };
    in
    pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_5-16-9);
}
