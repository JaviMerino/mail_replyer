{
  python3Packages
}:
python3Packages.buildPythonPackage {
  name = "email_replyer";
  version = "0.1.0";
  pyproject = true;
  src = ./.;
  buildInputs = [
    python3Packages.hatchling
  ];
  propagatedBuildInputs = [
    python3Packages.fire
  ];
}
