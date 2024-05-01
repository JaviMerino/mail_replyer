import fire
import os
from pathlib import Path

def generate_email(context: str | os.PathLike):
    print(f"Contents of {context}")
    context_file = Path(context)
    with open(context_file) as ctxt:
        print(ctxt.read())

def main():
    fire.Fire(generate_email)
