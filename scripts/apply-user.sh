nix build ../#homeConfigurations.ap-${HOSTNAME}.activationPackage
./result/activate
rm -rf ./result
