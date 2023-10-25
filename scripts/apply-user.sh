export NIXPKGS_ALLOW_INSECURE=1
nix build ../#homeConfigurations.${USERNAME}-${HOSTNAME}.activationPackage --show-trace
./result/activate
rm -rf ./result
