{ pkgs, ... }:

{
  environment.systemPackages = with pkgs.rocmPackages; [
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
