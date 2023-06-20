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
    virtmanager
    gptfdisk
    acpi
    virglrenderer
    nautilus-python
    nautilus-open-any-terminal
  ];
}
