{ inputs, system, ... }:
{
  home.packages = [
    inputs.nixvim.packages."${system}".default
  ];
}
