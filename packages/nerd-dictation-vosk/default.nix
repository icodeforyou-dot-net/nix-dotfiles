self: { pkgs, lib, stdenv, python3Packages, ... }@super:

{

  nerd-dictation = pkgs.callPackage (import ./pkgs/nerd-dictation) { };
  vosk-api = pkgs.callPackage (import ./pkgs/vosk-api) { };
  kaldi = pkgs.callPackage (import ./pkgs/kaldi) { };

  # vosk-python = pkgs.python3.callPackage (import ./pkgs/python-vosk) { };

  # pythonOverrides = selfPython: superPython: {
  #   vosk-python = selfPython.callPackage (import ./pkgs/python-vosk) { };
  # };
  # python3 = python3.pkgs.override { packageOverrides = pythonOverrides; };

  python3Vosk = pkgs.python3.override {
    packageOverrides = self: super: {
      vosk-python = self.callPackage (import ./pkgs/python-vosk) { };
    };
  };
}
