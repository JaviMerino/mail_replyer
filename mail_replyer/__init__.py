import fire
import jinja2
import os
from pathlib import Path

def generate_prompt(context_file: Path, instructions_file: Path):
    env = jinja2.Environment(loader=jinja2.PackageLoader("mail_replyer"))
    prompt_template = env.get_template("prompt_template.txt")

    with open(instructions_file) as inst_file:
        instructions = inst_file.read()
    with open(context_file) as ctxt_file:
        ctxt = ctxt_file.read()

    return prompt_template.render(context=ctxt, additional_instructions=instructions)

def generate_email(context: str | os.PathLike, instructions: str | os.PathLike):
    context_file = Path(context)
    instructions_file = Path(instructions)
    prompt = generate_prompt(context_file, instructions_file)
    #ollama_reply = ollama.generate(model=MODEL, prompt=prompt)
    # print(ollama_reply['response'])
    print(prompt)

def main():
    fire.Fire(generate_email)
