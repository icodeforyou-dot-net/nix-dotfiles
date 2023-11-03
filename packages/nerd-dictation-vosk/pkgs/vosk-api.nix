{ pkgs, fetchFromGitHub, stdenv, openblas, openfst, kaldi, mkl ? null, ... }:
let
  repo = fetchFromGitHub {
    owner = "alphacep";
    repo = "vosk-api";
    rev = "4c562e15a48bc1467bffaec775402c520bcd6adc";
    sha256 = "1inmw0wd0zvbz83cwk6x8svwycgxzzd9vd0n12xgjc4ypqlk8fk9";
  };
in
stdenv.mkDerivation {
  name = "vosk-api";
  version = "0.3.32";

  KALDI_ROOT = kaldi;
  OPENFST_ROOT = openfst;
  OPENBLAS_ROOT = openblas;
  HAVE_MKL = if mkl == null then 0 else 1;

  buildInputs = [ kaldi openfst openblas mkl ];

  src = "${repo}/src";
  patches = [ ./vosk-api-dynamic.patch ];
  installPhase = ''
    mkdir -p $out/{lib,include/vosk}
    cp *.so $out/lib/
    cp *.h  $out/include/vosk/
  '';
}
