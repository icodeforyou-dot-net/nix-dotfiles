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
              rev = "b197f11a5d4779004fed081f7fb59e4f212ea620";
              sha256 = "8yeV6oiTKPjRGALMqhKu1q3M0MnZSU9RPoSEBRKOGP0=";
            };

          kernelPatches = [ ];

          extraMeta.branch = "5.16";
        } // (args.argsOverride or { }));
      linux_5-16-9 = pkgs.callPackage linux_pkg { };
    in
    pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_5-16-9);
}
