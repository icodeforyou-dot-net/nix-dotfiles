{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "simp1e-cursor-theme-catppuccin-frappe";
  version = "20220903";


  src = fetchurl {
    # url = "https://gitlab.com/cursors/simp1e/-/jobs/3269567407/artifacts/raw/built_themes/Simp1e-Catppuccin-Frappe.tgz";
    # sha256 = "0r6fm340xr1w3hqjpgfba7gjlkfbngks6q1h2g45kzf02ays0kl3";
    url = "https://gitlab.com/cursors/simp1e/-/jobs/4889893448/artifacts/raw/built_themes/Simp1e-Catppuccin-Frappe.tar.xz";
    sha256 = "SqPfiB6d1bnp4UG0OZmVmpAVyaSt57mPMYp8ZWl9e5w=";
  };

  # phases = "unpackPhase installPhase";

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r Simp1e-Catppuccin-Frappe/ $out/share/icons/Simp1e-Catppuccin-Frappe
  '';

  meta = with lib; {
    description = "Simp1e cursor theme using the Catppuccin frappe color palette";
    homepage = "https://gitlab.com/cursors/simp1e";
    license = licenses.gpl3;
    platforms = platforms.all;
    maintainers = with maintainers; [ ];
  };
}
