{
  users.users.ap = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "vboxusers" "lxd" "docker" "podman" "video" "audio" ];
    initialPassword = "123";
  };
}
