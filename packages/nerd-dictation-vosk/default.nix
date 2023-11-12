self: { pkgs, lib, stdenv, python3Packages, ... }@super:

{
  nerd-dictation = pkgs.callPackage (import ./pkgs/nerd-dictation) { };
  vosk-api = pkgs.callPackage (import ./pkgs/vosk-api) { };
  kaldi = pkgs.callPackage (import ./pkgs/kaldi) { };

  python3Vosk = pkgs.python3.override {
    packageOverrides = self: super: {
      vosk-python = self.callPackage (import ./pkgs/python-vosk) { };
    };
  };
}
