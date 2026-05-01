<div align="center">

<!-- HEADER BANNER -->
<img src="https://capsule-render.vercel.app/api?type=waving&color=0:000000,50:00ff9d,100:00d4ff&height=200&section=header&text=Dense%20Coder&fontSize=72&fontColor=ffffff&fontAlignY=38&desc=A%20Claude%20Skill%20that%20enforces%20senior-engineer%20code%20style&descSize=16&descAlignY=58&descColor=ccfff0&animation=fadeIn" width="100%" />

<!-- BADGES -->
<p>
  <img src="https://img.shields.io/badge/Claude-Skill-00ff9d?style=for-the-badge&logo=anthropic&logoColor=black&labelColor=0a0a0a" />
  <img src="https://img.shields.io/badge/Token_Savings-~75%25-00d4ff?style=for-the-badge&logo=lightning&logoColor=black&labelColor=0a0a0a" />
  <img src="https://img.shields.io/badge/License-MIT-ffffff?style=for-the-badge&logoColor=black&labelColor=0a0a0a" />
  <img src="https://img.shields.io/badge/Open-Source-fbbf24?style=for-the-badge&logo=github&logoColor=black&labelColor=0a0a0a" />
</p>

<p>
  <img src="https://img.shields.io/badge/Activate%20with-%2Fdense-00ff9d?style=flat-square&labelColor=111111" />
  <img src="https://img.shields.io/badge/One%20best%20solution-always-00d4ff?style=flat-square&labelColor=111111" />
  <img src="https://img.shields.io/badge/No%20docstrings-on%20obvious%20fns-ff4d6d?style=flat-square&labelColor=111111" />
</p>

<br />

> **Compact. Idiomatic. No noise. No hand-holding.**
> 
> *Built for developers who think in code — not in explanations.*

<br />

</div>

---

## ◈ What Is Dense Coder?

Dense Coder is a **Claude Skill** — a structured system prompt that changes how Claude generates code.

By default, Claude writes for the median user: it adds docstrings to obvious functions, comments every line, offers three approaches when one is correct, and wraps every response in explanation you didn't ask for.

Dense Coder overrides that default. It tells Claude to write the way a seasoned engineer reviews a PR: **state the issue, show the fix, move on.**

```
What it is:   A SKILL.md file you install once and activate with /dense
What it isn't: A plugin, extension, or model fine-tune. It's a well-designed system prompt.
```

---

## ◈ Core Rules

```
Every line must earn its place.
If a line can be removed without changing behavior or readability — remove it.
Idiomatic code IS the comment.
```

---

## ◈ Behavior Matrix

| Behavior | Default Claude | Dense Coder |
|:--|:--:|:--:|
| Docstring on `def add(a, b)` | ✅ Always | ❌ Never |
| `# increment i` comment | ✅ Common | ❌ Removed |
| Multiple approaches offered | ✅ Frequent | ❌ One best |
| `result = x; return result` | ✅ Common | ❌ `return x` |
| List comp vs verbose loop | Varies | ✅ Always idiomatic |
| Debug `print` left in code | Sometimes | ❌ Never |
| Non-obvious algorithm notes | Sometimes | ✅ Always kept |
| Security-critical comments | Sometimes | ✅ Always kept |

---

## ◈ Before → After

### Python — Unique Sorted Words

<table>
<tr>
<td width="50%">

**❌ Default Claude** `~200 tokens`
```python
def get_unique_words(text):
    """
    Takes a string of text and returns
    a list of unique words in lowercase,
    sorted alphabetically.
    Args:
        text: The input string
    Returns:
        List of unique sorted words
    """
    text_lower = text.lower()    # lowercase
    words = text_lower.split()   # split
    unique_words = set(words)    # dedup
    result = sorted(unique_words)# sort
    return result
```

</td>
<td width="50%">

**✅ Dense Coder** `~25 tokens`
```python
def unique_words(text):
    return sorted(set(text.lower().split()))
```

<br />

> Same behavior. One-eighth the tokens.

</td>
</tr>
</table>

### React — Counter Component

<table>
<tr>
<td width="50%">

**❌ Default Claude** `~35 lines`
```jsx
import React, { useState } from 'react';

const Counter = () => {
  const [count, setCount] = useState(0);
  const handleIncrement = () => {
    setCount(count + 1);
  };
  const handleDecrement = () => {
    setCount(count - 1);
  };
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

</td>
<td width="50%">

**✅ Dense Coder** `~8 lines`
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

</td>
</tr>
</table>

---

## ◈ Token Savings Reference

| Pattern Removed | Approx. Savings |
|:--|:--|
| Docstring on obvious function | `15 – 40 tokens` |
| Inline comment on clear line | `5 – 10 tokens` |
| Multi-line → list comprehension | `8 – 20 tokens` |
| Intermediate return variable | `3 – 5 tokens` |
| `.format()` → f-string | `2 – 4 tokens` |
| Redundant type hints on locals | `3 – 8 tokens` |

> **Typical savings per function: 40 – 75%**

---

## ◈ Installation

<details>
<summary><b>🖥️ &nbsp;Option 1 — Antigravity IDE (Recommended)</b></summary>

<br />

```bash
git clone https://github.com/Kanishk0107/dense-coder.git
```

Copy `SKILL.md` to your global skills directory:

```bash
# Windows
copy SKILL.md %USERPROFILE%\.gemini\antigravity\skills\dense-coder\SKILL.md

# macOS / Linux
cp SKILL.md ~/.gemini/antigravity/skills/dense-coder/SKILL.md
```

Reload skills. Type `/dense` in any conversation.

</details>

<details>
<summary><b>⚡ &nbsp;Option 2 — Claude API (System Prompt Injection)</b></summary>

<br />

```python
with open("SKILL.md") as f:
    dense_coder = f.read()

response = client.messages.create(
    model="claude-opus-4-5",
    system=dense_coder,
    messages=[{"role": "user", "content": "Refactor this function..."}]
)
```

</details>

<details>
<summary><b>🌐 &nbsp;Option 3 — Claude Desktop / Web</b></summary>

<br />

The skill file is plain markdown. Paste the contents of `SKILL.md` as a **Project Instruction** or **Custom System Prompt** in your Claude environment.

No plugin. No extension. No model fine-tune.

</details>

<details>
<summary><b>🛠️ &nbsp;Option 4 — IDE Rules Files (Cursor / Windsurf)</b></summary>

<br />

Add to `.cursorrules` or `AGENTS.md`:

```
Apply Dense Coder rules when writing or reviewing code:
- Every line must earn its place
- One best solution — no alternatives
- Idiomatic code only
- No docstrings on self-evident functions
- No inline comments on clear code
```

</details>

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

> If you get 15 lines with a docstring and step-by-step comments — the skill is not active.

---

## ◈ Usage

### Activation Commands

| Command | Mode |
|:--|:--|
| <kbd>/dense</kbd> | Standard — compact, idiomatic, one solution |
| <kbd>/dense ultra</kbd> | Maximum compression — abbreviations, collapsed vars, chained methods |
| <kbd>/dense off</kbd> | Reverts to default Claude style |

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

## ◈ When To Use · When To Skip

<table>
<tr>
<td width="50%">

### ✅ Use Dense Coder

- Code reviews — issues, not tutorials
- Refactoring sessions
- Bug fixes — patch only, no narration
- Agentic pipelines — lower cost per call
- IDE workflows (Cursor, Windsurf, VS Code)

</td>
<td width="50%">

### ⛔ Skip Dense Coder

- Learning a new language or framework
- Writing documentation or tutorials
- Onboarding juniors to a codebase
- Deep theory / architecture discussions

</td>
</tr>
</table>

---

## ◈ Examples

| File | What It Shows |
|:--|:--|
| [`examples/compact-refactor.md`](examples/compact-refactor.md) | Full refactor with before/after |
| [`examples/senior-code-review.md`](examples/senior-code-review.md) | Security-aware review, patch included |
| [`examples/token-efficient-debugging.md`](examples/token-efficient-debugging.md) | Bug diagnosis + minimal fix, no padding |

---

## ◈ Docs

| Doc | Contents |
|:--|:--|
| [`docs/installation.md`](docs/installation.md) | Extended install guide for all environments |
| [`docs/usage.md`](docs/usage.md) | Full command and activation reference |
| [`docs/philosophy.md`](docs/philosophy.md) | Why Dense Coder is designed this way |
| [`docs/README.hi.md`](docs/README.hi.md) | Hindi / Hinglish guide |

---

## ◈ Roadmap

- [ ] Language-specific examples: Go, Rust, SQL, Shell
- [ ] Claude Desktop step-by-step install guide
- [ ] Cursor / Windsurf `.cursorrules` recipes
- [ ] Community examples folder
- [ ] Token count benchmark across real open-source functions

---

## ◈ Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md).

Short version: PRs need a before/after example with token counts. No motivational content. Keep docs shorter than what they explain.

---

## ◈ Author

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=rect&color=0:000000,100:001a0f&height=2&section=header" width="100%" />

<br />

<img src="https://avatars.githubusercontent.com/Kanishk0107" width="80" style="border-radius:8px" />

### Kanishk Bhardwaj

*Claude Skill Developer · AI Workflow Builder*

<p>
  <a href="https://github.com/Kanishk0107">
    <img src="https://img.shields.io/badge/GitHub-Kanishk0107-00ff9d?style=for-the-badge&logo=github&logoColor=black&labelColor=0a0a0a" />
  </a>
  <a href="https://www.linkedin.com/in/kanishk-a-bhardwaj/">
    <img src="https://img.shields.io/badge/LinkedIn-Kanishk%20Bhardwaj-00d4ff?style=for-the-badge&logo=linkedin&logoColor=black&labelColor=0a0a0a" />
  </a>
  <a href="https://www.instagram.com/kanishk_0107/">
    <img src="https://img.shields.io/badge/Instagram-kanishk__0107-ff4d6d?style=for-the-badge&logo=instagram&logoColor=black&labelColor=0a0a0a" />
  </a>
</p>

</div>

---

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:00d4ff,50:00ff9d,100:000000&height=120&section=footer&text=Built%20for%20developers%20who%20think%20in%20code&fontSize=14&fontColor=ccfff0&fontAlignY=65&animation=fadeIn" width="100%" />

</div>
