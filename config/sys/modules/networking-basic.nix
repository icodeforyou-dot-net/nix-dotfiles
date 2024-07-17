{
  networking = {
    firewall.enable = true;
    hosts = {
      "192.168.200.100" = [ "minikube.local" ];
      "127.0.0.1" = [ "host.docker.internal" ];
    };
    networkmanager.enable = true;
  };
}
