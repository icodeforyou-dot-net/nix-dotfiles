# Dotfiles for my NixOS :snowflake: machines
 Personal NixOS :snowflake: dotfiles for 2013 Macbook and AMD Ryzen PC

## Structure

Here is the current structure of the repo (will be changed often):

```
./
├── flake.nix
├── flake.lock
└── hosts
      ├── archon
      │     ├── configuration.nix
      │     ├── hardware-configuration.nix
      │     └── home.nix
      └── proteus
            ├── configuration.nix
            ├── hardware-configuration.nix
            └── home.nix

```

- `flake.nix`: basic flake for both system configurations.
- `hardware-configuration.nix`: hardware setup for each machine.
- `home.nix`: anything related to home-manager for each machine for my user.
- `configuration.nix`: basic configuration for each machine.

## Import Hierarchy

Some files import from others. They like to depend on each other to avoid duplication. Code is lazy. But relationsships get hard to follow quickly. So I wrote them down here. May this be of use.

## Helper Scripts

The helper scripts `apply-system.sh`, `apply-user.sh` and `test_system.sh` apply or test configuration for system or home-manager respectivly. In case the bootloader start to act up, you might want to try `rebuild-bootloader.sh`.

```console
```
