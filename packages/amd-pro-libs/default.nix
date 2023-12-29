self: { pkgs, lib, stdenv, python3Packages, ... }@super:

{
  amdgpu-pro-amf = pkgs.callPackage (import ./pkgs/amdgpu-pro-amf) { };
  amdgpu-pro-vulkan = pkgs.callPackage (import ./pkgs/amdgpu-pro-vulkan) { };
  amdgpu-pro-opengl = pkgs.callPackage (import ./pkgs/amdgpu-pro-opengl) { };
}
