nix build ../#homeConfigurations.${USERNAME}-${HOSTNAME}.activationPackage --show-trace
./result/activate
rm -rf ./result
