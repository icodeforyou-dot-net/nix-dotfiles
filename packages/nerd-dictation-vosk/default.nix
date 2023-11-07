self: { pkgs, lib, stdenv, python3Packages, ... }@super:
{

  nerd-dictation = pkgs.callPackage (import ./pkgs/nerd-dictation) { };
  vosk-api = pkgs.callPackage (import ./pkgs/vosk-api) { };
  vosk-python = pkgs.callPackage (import ./pkgs/python-vosk) { };
  kaldi = pkgs.callPackage (import ./pkgs/kaldi) { };

}
