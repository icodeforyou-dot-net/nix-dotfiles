{
  virtualisation.virtualbox = {
    guest.enable = false;
    host = {
      enable = true;
      enableHardening = true;
      enableExtensionPack = true;
    };
  };
}
