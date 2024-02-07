{
  description = "mail replyer";

  inputs.nixpkgs.url = "github:JaviMerino/nixpkgs/python-ollama";

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = rec {
          mail_replyer = pkgs.callPackage ./. { };
          default = mail_replyer;
        };
      });
}
