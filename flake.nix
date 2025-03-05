{
  description = "expert-lsp.org website";

  inputs = {
    beam-flakes = {
      url = "github:mhanberg/nix-beam-flakes";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs @ {
    beam-flakes,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [beam-flakes.flakeModule];

      systems = ["aarch64-darwin" "x86_64-darwin" "x86_64-linux"];

      perSystem = {pkgs, ...}: {
        beamWorkspace = {
          enable = true;
          devShell = {
            packages = with pkgs; [
              netlify-cli
            ];
            languageServers.elixir = true;
            languageServers.erlang = false;
          };
          versions = {
            fromToolVersions = ./.tool-versions;
          };
        };
      };
    };
}
