{
  description = "Tree-sitter grammar for gitattributes";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      with import nixpkgs { inherit system; }; {
        devShells.default = mkShell {
          nativeBuildInputs = [
            nodejs
            nodePackages.npm
            tree-sitter
          ];
        };
      });
}
