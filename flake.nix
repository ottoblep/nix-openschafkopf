{
  description = "Nix Flake for Openschafkopf";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  inputs.nixpkgs-old.url = "github:nixos/nixpkgs/nixos-20.09";

  outputs =  { self, nixpkgs, nixpkgs-old, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-old = nixpkgs-old.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.callPackage ./pkgs/openschafkopf { lessc=pkgs-old.lessc; };

      overlays.default = final: prev: {
        openschafkopf = self.packages.${system}.default;
      };
    };
}