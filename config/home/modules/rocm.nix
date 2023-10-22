{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs.rocmPackages; [
    rpp-opencl
    rpp-hip
    rpp
    rocminfo
    rocm-smi
    rocm-runtime
    miopen-opencl
    miopen-hip
    miopen
    hipsparse
    hipsolver
    hipfort
    hipfft
    hipblas
  ];
}
