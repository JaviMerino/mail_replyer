{
  fetchPypi,
  python3Packages,
}:

python3Packages.buildPythonPackage {
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
    ollama
  ];
}
