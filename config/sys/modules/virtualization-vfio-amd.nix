{ config, lib, pkgs, ... }:
let
  user = "ap";
  platform = "amd";
  vfioIds = [ "1002:73e3" "1002:ab28" ];
in
{
  # Configure kernel options to make sure IOMMU & KVM support is on.
  boot = {
    kernelModules = [ "kvm-${platform}" "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];
    kernelParams = [ "${platform}_iommu=on" "${platform}_iommu=pt" "kvm.ignore_msrs=1" ];
    extraModprobeConfig = "options vfio-pci ids=${builtins.concatStringsSep "," vfioIds}";
  };

  # Add a file for looking-glass to use later. This will allow for viewing the guest VM's screen in a
  # performant way.
  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 ${user} qemu-libvirtd -"
  ];

  # Add virt-manager and looking-glass to use later.
  environment.systemPackages = with pkgs; [
    looking-glass-client
  ];

  # enable virt-manager
  programs.virt-manager.enable = true;

  # Enable virtualisation programs. These will be used by virt-manager to run your VM.
  virtualisation = {
    libvirtd = {
      enable = true;
      extraConfig = ''
        user="${user}"
      '';

      # Don't start any VMs automatically on boot.
      onBoot = "ignore";
      # Stop all running VMs on shutdown.
      onShutdown = "shutdown";

      qemu = {
        package = pkgs.qemu_kvm;
        ovmf = enabled;
        verbatimConfig = ''
           namespaces = []
          user = "+${builtins.toString config.users.users.${user}.uid}"
        '';
      };
    };
  };

  users.users.${user}.extraGroups = [ "qemu-libvirtd" "libvirtd" "disk" ];
}
