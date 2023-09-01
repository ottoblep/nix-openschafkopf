{ lib, stdenv, fetchFromGitHub, rustPlatform, pkg-config, openssl, ncurses, lessc }:
rustPlatform.buildRustPackage rec {
  pname = "openschafkopf";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "phimuemue";
    repo = "openschafkopf";
    rev = "68fbf161d24f62636f7615ba4ac431fb464144c1";
    sha256 = "sha256-c4wkqucljo48nktzToKveAJX6ZbROpIgC5Si5D4x08I=";
  };

  cargoLock.lockFile = "${src}/Cargo.lock";
  nativeBuildInputs = [ lessc ] ++ lib.optionals stdenv.isLinux [ pkg-config ];
  buildInputs = [ ncurses ] ++ lib.optionals stdenv.isLinux [ openssl ];
  checkType = "release";

  meta = with lib; {
    description = "Open Source Schafkopf";
    homepage = "https://github.com/phimuemue/openschafkopf";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}