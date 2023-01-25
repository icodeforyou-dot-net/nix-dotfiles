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
              rev = "9d30d7fad27e23f76738a4c8df18ba7eb74d2896";
              sha256 = "H1XcC0SykeYilGnjj5qjnm/akgrGF4FgOMQjLJmshxs=";
            };

          kernelPatches = [ ];

          extraMeta.branch = "5.16";
        } // (args.argsOverride or { }));
      linux_5-16-9 = pkgs.callPackage linux_pkg { };
    in
    pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_5-16-9);
}
