import asyncio
import fire
import jinja2
import ollama
import os
from pathlib import Path


def generate_prompt(context_file: Path, instructions_file: Path):
    """Read the context and the instructions, and apply it to the template to generate a prompt for the language model"""
    env = jinja2.Environment(loader=jinja2.PackageLoader("mail_replyer"))
    prompt_template = env.get_template("prompt_template.txt")

    with open(instructions_file) as inst_file:
        instructions = inst_file.read()
    with open(context_file) as ctxt_file:
        ctxt = ctxt_file.read()

    return prompt_template.render(context=ctxt, additional_instructions=instructions)


async def print_reply(model: str, prompt: str):
    """Stream the ollama reply"""
    client = ollama.AsyncClient()
    async for part in await client.generate(model=model, prompt=prompt, stream=True):
        print(part["response"], end="", flush=True)
    print("")


def generate_email(
    context: str | os.PathLike, instructions: str | os.PathLike, model: str = "mistral"
):
    """Generate an email reply.

    Args:
      context: A file providing extra context to the language model. For example, "John is a manager at Banana Tech".
      instructions: A file with the instructions.  For example, "Confirm that you are available on Monday".
      model: The language model to use
    """
    context_file = Path(context)
    instructions_file = Path(instructions)
    prompt = generate_prompt(context_file, instructions_file)

    asyncio.run(print_reply(model=model, prompt=prompt))


def main():
    fire.Fire(generate_email)
