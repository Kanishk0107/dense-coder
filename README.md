<div align="center">

<img src="logo.png" alt="Dense Coder Logo" width="150" />

# Dense Coder

**A Claude Skill that enforces senior-engineer code style.**  
Compact. Idiomatic. No noise. No hand-holding.

[![Claude Skill](https://img.shields.io/badge/Claude-Skill-6c47ff?style=flat-square&logo=anthropic&logoColor=white)](https://claude.ai)
[![Token Efficient](https://img.shields.io/badge/Token-Efficient-00c896?style=flat-square)](#token-savings-reference)
[![Open Source](https://img.shields.io/badge/Open-Source-f97316?style=flat-square&logo=github&logoColor=white)](https://github.com/Kanishk0107/dense-coder)
[![License: MIT](https://img.shields.io/badge/License-MIT-e2e8f0?style=flat-square)](LICENSE)

</div>

---

## What Is Dense Coder?

Dense Coder is a **Claude Skill** — a structured system prompt that changes how Claude generates code.

By default, Claude writes for the median user: it adds docstrings to obvious functions, comments every line, offers three approaches when one is correct, and wraps every response in explanation you didn't ask for.

Dense Coder overrides that default. It tells Claude to write the way a seasoned engineer reviews a PR: state the issue, show the fix, move on.

**What it is:** A `SKILL.md` file you install once and activate with `/dense`.  
**What it isn't:** A plugin, extension, or model fine-tune. It's a well-designed system prompt.

---

## Why This Exists

Experienced developers don't need Claude to explain what a for loop does. They need the 4-line implementation — not the 20-line version with a docstring, three inline comments, and two alternative approaches at the end.

Every extra line costs tokens. In agentic pipelines and long sessions, that adds up. More importantly, verbose AI output is just slower to work with — you read past noise to get to signal.

Dense Coder eliminates the noise.

---

## Core Rules

```
Every line must earn its place.
If a line can be removed without changing behavior or readability — remove it.
Idiomatic code IS the comment.
```

---

## Key Behaviors

| Behavior | Default Claude | Dense Coder |
|---|---|---|
| Docstring on `def add(a, b)` | ✅ Always | ❌ Never |
| `# increment i` comment | ✅ Common | ❌ Removed |
| Multiple approaches offered | ✅ Frequent | ❌ One best solution |
| `result = x; return result` | ✅ Common | ❌ `return x` |
| List comp vs verbose loop | Varies | ✅ Always idiomatic |
| Debug `print` left in code | Sometimes | ❌ Never |
| Non-obvious algorithm notes | Sometimes | ✅ Always kept |
| Security-critical comments | Sometimes | ✅ Always kept |

---

## Installation

Dense Coder works in any environment where you control the Claude system prompt.

### Option 1 — Antigravity IDE (Recommended)

```bash
git clone https://github.com/Kanishk0107/dense-coder.git
```

Copy `SKILL.md` to your global skills directory:

```
# Windows
C:\Users\<you>\.gemini\antigravity\skills\dense-coder\SKILL.md

# macOS / Linux
~/.gemini/antigravity/skills/dense-coder/SKILL.md
```

Reload skills. Type `/dense` in any conversation.

---

### Option 2 — Claude API (System Prompt Injection)

```python
with open("SKILL.md") as f:
    dense_coder = f.read()

response = client.messages.create(
    model="claude-opus-4-5",
    system=dense_coder,
    messages=[{"role": "user", "content": "Refactor this function..."}]
)
```

---

### Option 3 — Claude Desktop / Web

The skill file is plain markdown. Paste the contents of `SKILL.md` as a Project Instruction or Custom System Prompt in your Claude environment.

---

### Option 4 — IDE Rules Files

For Cursor, Windsurf, or similar IDE-native workflows, add to `.cursorrules` or `AGENTS.md`:

```
Apply Dense Coder rules when writing or reviewing code:
- Every line must earn its place
- One best solution — no alternatives
- Idiomatic code only
- No docstrings on self-evident functions
- No inline comments on clear code
```

---

### Verify It's Working

After install, send:
```
/dense — write a function that returns unique sorted words from a string
```

**Expected output (2 lines):**
```python
def unique_words(text):
    return sorted(set(text.lower().split()))
```

If you get 15 lines with a docstring and step-by-step comments — the skill is not active.

---

## Usage

### Activation Commands

| Command | Mode |
|---|---|
| `/dense` | Standard — compact, idiomatic, one solution |
| `/dense ultra` | Maximum compression — abbreviations, collapsed vars, chained methods |
| `/dense off` | Reverts to default Claude style |

Mode persists for the session until changed.

### Prompt Starters

```
/dense — refactor this. Best version only.
```
```
Review like a senior engineer. Flag real issues only. Show patch.
```
```
Fix the bug. Patch only. Skip the explanation.
```
```
Compress this without changing behavior.
```
```
/dense ultra — rewrite this module.
```

---

## Before / After

### Python — Unique Words

**Default Claude output (~200 tokens):**
```python
def get_unique_words(text):
    """
    Takes a string of text and returns a list of unique words
    in lowercase, sorted alphabetically.
    Args:
        text: The input string
    Returns:
        List of unique sorted words
    """
    text_lower = text.lower()      # Convert to lowercase
    words = text_lower.split()     # Split into words
    unique_words = set(words)      # Remove duplicates
    result = sorted(unique_words)  # Sort alphabetically
    return result
```

**Dense Coder output (~25 tokens):**
```python
def unique_words(text):
    return sorted(set(text.lower().split()))
```

Identical behavior.

---

### React — Counter Component

**Default Claude (~35 lines):**
```jsx
import React, { useState } from 'react';

const Counter = () => {
  const [count, setCount] = useState(0);
  const handleIncrement = () => { setCount(count + 1); };
  const handleDecrement = () => { setCount(count - 1); };
  return (
    <div className="counter">
      <button onClick={handleDecrement}>-</button>
      <span>{count}</span>
      <button onClick={handleIncrement}>+</button>
    </div>
  );
};
export default Counter;
```

**Dense Coder (~8 lines):**
```jsx
import { useState } from 'react'

export default function Counter() {
  const [n, setN] = useState(0)
  return <div>
    <button onClick={() => setN(n-1)}>-</button>
    <span>{n}</span>
    <button onClick={() => setN(n+1)}>+</button>
  </div>
}
```

---

## Token Savings Reference

These numbers are per-function estimates based on common verbose patterns, not across-the-board guarantees. Savings scale with how verbose the default output was.

| Pattern Removed | Approximate Token Savings |
|---|---|
| Docstring on obvious function | 15–40 tokens |
| Inline comment on clear line | 5–10 tokens |
| Multi-line → list comprehension | 8–20 tokens |
| Intermediate return variable | 3–5 tokens |
| `.format()` replaced by f-string | 2–4 tokens |
| Redundant type hints on locals | 3–8 tokens |

---

## Best Use Cases

- Code reviews where you want issues, not tutorials
- Refactoring sessions — compress without changing behavior
- Bug fixes — patch-only, no narration
- Agentic pipelines — lower cost per Claude call
- IDE workflows with Cursor, Windsurf, VS Code + Continue

## When Not to Use

- Learning a new language or framework — you need the explanation
- Writing documentation or tutorials — verbose is correct there
- Onboarding juniors to a codebase — they need the comments
- Deep theory / architecture discussions — understanding > compression

---

## Examples

Real use cases in [`examples/`](examples/):

| File | What It Shows |
|---|---|
| [`compact-refactor.md`](examples/compact-refactor.md) | Full refactor with before/after |
| [`senior-code-review.md`](examples/senior-code-review.md) | Security-aware review, patch included |
| [`token-efficient-debugging.md`](examples/token-efficient-debugging.md) | Bug diagnosis + minimal fix, no padding |

---

## Docs

| Doc | Contents |
|---|---|
| [`docs/installation.md`](docs/installation.md) | Extended install guide for all environments |
| [`docs/usage.md`](docs/usage.md) | Full command and activation reference |
| [`docs/philosophy.md`](docs/philosophy.md) | Why Dense Coder is designed this way |
| [`docs/README.hi.md`](docs/README.hi.md) | Hindi / Hinglish guide |

---

## Roadmap

- [ ] Language-specific examples: Go, Rust, SQL, Shell
- [ ] Claude Desktop step-by-step install guide
- [ ] Cursor / Windsurf `.cursorrules` recipes
- [ ] Community examples folder
- [ ] Token count benchmark across real open-source functions

---

## Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md).

Short version: PRs need a before/after example with token counts. No motivational content. Keep docs shorter than what they explain.

---

## License

[MIT](LICENSE)

---

## Author

**Kanishk Bhardwaj**  
Claude Skill Developer · AI Workflow Builder

[![GitHub](https://img.shields.io/badge/GitHub-Kanishk0107-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/Kanishk0107)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Kanishk%20Bhardwaj-0a66c2?style=flat-square&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/kanishk-a-bhardwaj/)
[![Instagram](https://img.shields.io/badge/Instagram-kanishk__0107-e1306c?style=flat-square&logo=instagram&logoColor=white)](https://www.instagram.com/kanishk_0107/)

---

<div align="center">
<sub>Built for developers who think in code, not in explanations.</sub>
</div>
