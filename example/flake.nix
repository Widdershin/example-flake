{
  description = "Basic devshell";

  inputs = {
    # Uses the latest stable Nixpkgs release
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";

    # flake-utils is used to simplify multi-system support
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        # Use nix develop to enter the dev shell
        devShells.default = pkgs.mkShell {
          packages = [
            # Add your development dependencies here
            pkgs.nodejs_24
          ];
        };

        # Run `nix fmt -- flake.nix` to format Nix files
        formatter = pkgs.nixfmt-rfc-style;
      }
    );
}
