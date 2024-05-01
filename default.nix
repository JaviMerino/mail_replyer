{
  fetchPypi,
  python3Packages,
}:
let
  ollama = python3Packages.buildPythonPackage rec {
      pname = "ollama";
      version = "0.1.2";
      format = "pyproject";
      src = fetchPypi {
        inherit pname version;
        sha256 = "Sa6110jOpvGVIQJvDNLxV0VklNE7k0Hk0QxnN7NZYTM=";
      };
      nativeBuildInputs = [
        python3Packages.poetry-core
      ];
      propagatedBuildInputs = with python3Packages; [
        httpx
        typing-extensions
      ];
      pythonImportsCheck = [
        "ollama"
      ];
  };
in
python3Packages.buildPythonPackage {
  name = "email_replyer";
  version = "0.1.0";
  pyproject = true;
  src = ./.;
  buildInputs = [
    python3Packages.hatchling
  ];
  propagatedBuildInputs = with python3Packages; [
    fire
    jinja2
    ollama
  ];
}
