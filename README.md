mail_replyer
============

An experimental sandbox for testing local large language models (LLMs)
to write emails.  It assumes you have a local
[`ollama`](https://ollama.com/) server (for example `ollama serve`).

Usage
-----

``` bash
mail_replyer.py --context <context_file> --instructions
<instruction_file> \
  [--model <model_file>]
```

**Mandatory parameters:**

* `context_file`: Path to a text file providing extra context to the
  LLM.
* `instructions`: Path to a text file with instructions for the LLM.

**Optional parameter:**

* `model`: Path to the desired LLM model file. Defaults to "gemma".
  Check the [ollama library](https://ollama.com/library) for other
  models and install it in ollama (`ollama pull <model>`) before
  trying to use it.
