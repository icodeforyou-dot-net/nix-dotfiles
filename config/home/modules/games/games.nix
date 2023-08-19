{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Settlers II clone but better
    # unstable.widelands

    # Open source version of XCom
    # unstable.openxcom

    # Roller Coaster Tycoon II
    # unstable.openrct2

    # Diablo I
    unstable.devilutionx

    # (unstable.devilutionx.overrideAttrs
    #   (oldAttrs: rec {
    #     pname = "devilutionx";
    #     version = "1.5.0";
    #     src = fetchFromGitHub {
    #       owner = "diasurgical";
    #       repo = "devilutionX";
    #       rev = version;
    #       sha256 = "sha256-SYcekEGOKqTgClVMkE2slA2qIgexxBXBFuK2WC0ACxk=";
    #     };
    #   }))

    # Solarus RPG editor
    # unstable.solarus

    # Dark Forces engines
    # unstable.theforceengine

    # Stalker: Call of Pripyat
    # unstable.openxray
  ];
}
