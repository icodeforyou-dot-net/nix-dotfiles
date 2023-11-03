{ pkgs, fetchFromGitHub, python3Packages, vosk-api, ... }:

let
  repo = fetchFromGitHub {
    owner = "alphacep";
    repo = "vosk-api";
    rev = "4c562e15a48bc1467bffaec775402c520bcd6adc";
    sha256 = "1inmw0wd0zvbz83cwk6x8svwycgxzzd9vd0n12xgjc4ypqlk8fk9";
  };
in
python3Packages.buildPythonPackage rec {

  pname = "python-vosk";
  version = "0.3.32";
  src = "${repo}/python";
  patches = [ ./python-vosk-dynamic.patch ];

  doCheck = false;
  propagatedBuildInputs = [ python3Packages.cffi vosk-api ];
  VOSK_API_H = "${vosk-api}/include/vosk_api.h";
}
