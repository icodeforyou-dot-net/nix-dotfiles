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
              rev = "03fdd1adcac67e38b78a83a5f26979d5efe1279f";
              sha256 = "20BtNw6uuJDa4Vo8ti3JfMIHVvuQHha7zhLymKMmajo=";
            };

          kernelPatches = [ ];

          extraMeta.branch = "5.16";
        } // (args.argsOverride or { }));
      linux_5-16-9 = pkgs.callPackage linux_pkg { };
    in
    pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_5-16-9);
}
