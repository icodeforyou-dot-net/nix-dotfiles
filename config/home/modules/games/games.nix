{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Settlers II clone but better
    unstable.widelands

    # Legend of Zelda Ocarina of Time port
    unstable.shipwright

    # Open source version of XCom
    unstable.openxcom

    # Roller Coaster Tycoon II
    unstable.openrct2

    # Diablo I
    unstable.devilutionX

    # Solarus RPG editor
    unstable.solarus

    # Dark Forces engines
    unstable.theforceengine

    # Stalker: Call of Pripyat
    unstable.openxray
  ];
}
