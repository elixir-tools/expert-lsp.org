{
  description = "expert-lsp.org website";

  inputs = {
    beam-flakes = {
      url = "github:elixir-tools/nix-beam-flakes";
      inputs.flake-parts.follows = "flake-parts";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  nixConfig = {
    extra-substituters = [
      "https://nix-beam-flakes.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-beam-flakes.cachix.org-1:iRMzLmb/dZFw7v08Rp3waYlWqYZ8nR3fmtFwq2prdk4="
    ];
  };

  outputs = inputs @ {
    beam-flakes,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [beam-flakes.flakeModule];

      systems = ["aarch64-darwin" "x86_64-darwin" "x86_64-linux"];

      perSystem = {
        pkgs,
        config,
        ...
      }: {
        beamWorkspace = {
          enable = true;
          devShell = {
            enable = false;
            languageServers.elixir = false;
            languageServers.erlang = false;
          };
          versions = {
            elixir = "1.19.4";
            erlang = "28.2";
          };
        };
        devShells = let
          buildPackages = with pkgs; [
            netlify-cli
            tailwindcss_4
          ];
          devPackages = with pkgs; [
            tailwindcss-language-server
          ];
        in {
          netlify = pkgs.mkShell {
            packages = config.beamWorkspace.devShell.packages ++ buildPackages;
          };
          default = pkgs.mkShell {
            packages = config.beamWorkspace.devShell.packages ++ buildPackages ++ devPackages;
            shellHook = ''
              export MIX_TAILWIND_PATH="${pkgs.tailwindcss_4}/bin/tailwindcss"
            '';
          };
        };
      };
    };
}
