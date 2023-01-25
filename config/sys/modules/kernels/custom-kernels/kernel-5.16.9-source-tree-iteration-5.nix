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
              rev = "73299da3017d3113f1a16a03895b2ab9892998df";
              sha256 = "QEXWfFAxFBxWLkuHwLbeF/2IAS1JrFQugcSNiQFN9Sk=";
            };

          kernelPatches = [ ];

          extraMeta.branch = "5.16";
        } // (args.argsOverride or { }));
      linux_5-16-9 = pkgs.callPackage linux_pkg { };
    in
    pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_5-16-9);
}
