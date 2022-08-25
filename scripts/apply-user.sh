nix build ../#homeConfigurations.${USERNAME}-${HOSTNAME}.activationPackage
./result/activate
rm -rf ./result
