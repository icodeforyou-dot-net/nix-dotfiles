{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    pstree
    lm_sensors
    killall
    unzip
    lsof
    gocryptfs
    gptfdisk
    acpi
    virglrenderer
    gnome.nautilus-python
  ];

  # To make nautilus extensions gsettings available
  services.xserver.desktopManager.gnome.extraGSettingsOverridePackages = with pkgs; [
    nautilus-open-any-terminal
  ];

  environment.sessionVariables.NAUTILUS_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";

  environment.pathsToLink = [
    "/share/nautilus-python/extensions"
  ];
}
