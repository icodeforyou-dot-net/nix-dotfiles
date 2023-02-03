{ config, pkgs, ... }:

{
  home.file.".config/nvim/init.lua" = {
    executable = false;
    source = "./nvim/init.lua";
  };
}
