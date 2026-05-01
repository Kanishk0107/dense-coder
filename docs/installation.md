# Installation Guide

## Requirements

- A Claude environment that supports Skills (Claude Desktop, Antigravity, or API-based setup)
- Git (optional, for cloning)

---

## Method 1 — Antigravity / AI Coding IDEs

Place `SKILL.md` in the global skills directory:

```
~/.gemini/antigravity/skills/dense-coder/SKILL.md
```

On Windows:
```
C:\Users\<you>\.gemini\antigravity\skills\dense-coder\SKILL.md
```

Restart Claude or reload skills. Activate with `/dense`.

---

## Method 2 — Claude Desktop

1. Open Claude Desktop → Settings → Skills
2. Click "Import Skill" or "Add from file"
3. Select `SKILL.md` from this repo
4. Name it `dense-coder`
5. Save and enable

> Note: Claude Desktop skill import UI may vary by version. Check Anthropic docs for current flow.

---

## Method 3 — System Prompt (API / Custom Wrappers)

Copy the full contents of `SKILL.md` and inject into your system prompt:

```python
with open("SKILL.md") as f:
    skill = f.read()

response = client.messages.create(
    model="claude-opus-4-5",
    system=skill,
    messages=[{"role": "user", "content": your_prompt}]
)
```

---

## Method 4 — Manual Activation (No Install)

Paste this at the start of any Claude conversation:

```
Dense Coder mode active. Rules:
- Every line must earn its place
- No docstrings on obvious functions
- No comments on clear code
- One best solution, no alternatives
- Idiomatic code only
- No hand-holding
```

---

## Verify Installation

After install, run:

```
/dense — write a function that returns unique words from a string
```

Expected output: 2 lines, no docstring, no comments.

If you get a 15-line function with a docstring and step-by-step comments, the skill is not active.

---

Made by [Kanishk Bhardwaj](https://github.com/Kanishk0107) · [LinkedIn](https://www.linkedin.com/in/kanishk-a-bhardwaj/) · [Instagram](https://www.instagram.com/kanishk_0107/)
