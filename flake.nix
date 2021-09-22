{
  description = "This is a wrapper around NUR to allow using tools such as `nix run` to work";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
  inputs.nur.url = "github:nix-community/NUR";

  outputs = { self, nixpkgs, nur }: let
    lib = nixpkgs.lib;
  in {
    legacyPackages = lib.genAttrs lib.platforms.all (system: {
      nur = (import nixpkgs { inherit system; overlays = [ nur.overlay]; }).nur;
    });
  };
}
