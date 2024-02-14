{
  description = "mail replyer";

  outputs = { nixpkgs, flake-utils, nur, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ nur.overlay ];
        };
        python-ollama = pkgs.nur.repos.javimerino.python-ollama;
      in
      {
        packages = rec {
          mail_replyer = pkgs.callPackage ./. { inherit python-ollama; };
          default = mail_replyer;
        };
      });
}
