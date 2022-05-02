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

  boot = {
      cleanTmpDir = true;
      loader = {
        efi.canTouchEfiVariables = true;
        systemd-boot.enable = true;
      };
      supportedFilesystems = [ "btrfs" ];
  };

  networking = {
      firewall.enable = true;
      networkmanager.enable = true;
  };

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
  };

  services = {
      printing = {
        enable = true;
        drivers = with pkgs; [ hplip ];
        };
      xserver = {
          enable = true;
          desktopManager.gnome.enable = true;
          displayManager.gdm.enable = true;
          layout = "us";
        };
  };

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

  virtualisation = {
    docker = {
        enable = true;
        enableOnBoot = false;
    };

    libvirtd = {
        enable = true;
        # qemuOvmf = true;
        qemu.runAsRoot = false;
        onBoot = "ignore";
        onShutdown = "shutdown";
    };

    lxc.lxcfs.enable = true;
    lxd.enable = true;

    virtualbox = {
        guest.enable = false;
        host = {
            enable = true;
            enableHardening = true;
            enableExtensionPack = true;
        };
    };
  };

  system.stateVersion = "21.05";

}