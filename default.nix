{ fetchPypi
, python3Packages
, python-ollama
}:

python3Packages.buildPythonApplication {
  name = "mail_replyer";
  version = "0.1.0";
  pyproject = true;
  src = ./.;
  buildInputs = [
    python3Packages.hatchling
  ];
  propagatedBuildInputs = with python3Packages; [
    fire
    jinja2
    python-ollama
  ];
}
