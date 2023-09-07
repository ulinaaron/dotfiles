{
  description = "Tree Sitter Rescript";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (
        system:
          let
            pkgs = import nixpkgs { inherit system; };
          in
            {
              devShell =  pkgs.mkShell {
                buildInputs = with pkgs; [
                  nodejs
                  (yarn.override { nodejs = nodejs; })
                  tree-sitter
                ];
              };
            }
      );
}