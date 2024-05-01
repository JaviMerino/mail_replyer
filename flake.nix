{
  description = "mail replyer";

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
