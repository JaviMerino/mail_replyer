{
  description = "mail replyer";

  inputs.my_nur = {
    url = "github:JaviMerino/nur-packages";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, flake-utils, my_nur, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        python-ollama = my_nur.packages.${system}.python-ollama;
      in
      {
        packages = rec {
          mail_replyer = pkgs.callPackage ./. { inherit python-ollama; };
          default = mail_replyer;
        };
      });
}
