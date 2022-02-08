{ config, lib, pkgs, ... }:

{
  nix = {
        package = pkgs.nixUnstable;
        extraOptions = ''
        experimental-features = nix-command flakes
        '';
  };

  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "btrfs" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.cleanTmpDir = true;

  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.layout = "us";
  services.xserver.windowManager.openbox.enable = true;
  
  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.ap = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "vboxusers" "lxd" "docker" ];
    initialPassword = "123";
  };

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
  ];

  security.sudo.execWheelOnly = true;

  programs.dconf.enable = true;

  programs.firejail = {
        enable = true;
        wrappedBinaries = {
                firefox = {
                        executable = "${lib.getBin pkgs.firefox}/bin/firefox";
                        profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
                };
                discord = {
                        executable = "${lib.getBin pkgs.discord}/bin/discord";    
                        profile = "${pkgs.firejail}/etc/firejail/discord.profile";
                };                                                                                                                                        };
  };

  virtualisation.libvirtd = {
    enable = true;
    # qemuOvmf = true;
    qemu.runAsRoot = false;
    onBoot = "ignore";
    onShutdown = "shutdown";
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };

  virtualisation.virtualbox.host = {
    enable = true;
    enableHardening = true;
    enableExtensionPack = true;
  };

  virtualisation.virtualbox.guest.enable = false;

  virtualisation.lxd.enable = true;
  virtualisation.lxc.lxcfs.enable = true;

  system.stateVersion = "21.05";

}