# Usage Reference

## Modes

| Command | Mode | Description |
|---|---|---|
| `/dense` | Standard | Compact, idiomatic, senior-level output |
| `/dense ultra` | Ultra | Maximum compression — abbreviations, chained methods, collapsed vars |
| `/dense off` | Off | Reverts to standard Claude output style |

Mode persists for the entire session until changed.

---

## Activation Phrases (Auto-Trigger)

Dense Coder activates automatically when the user says:

- "write compact code"
- "less lines"
- "efficient code"
- "senior style"
- "no bloat"
- "pro-level code"
- "refactor this"
- "low token code"
- `/dense` or `/compact`

---

## Recommended Prompt Patterns

### Refactor
```
/dense — refactor this [language] function. No alternatives, just best version.
```

### Code Review
```
Review this like a senior engineer. Flag only real issues. Show patch.
```

### Bug Fix
```
Fix the bug. Patch only. No hand-holding.
```

### Implementation
```
/dense — implement [feature]. Single best approach. Production-ready.
```

### Compression
```
Compress this without changing behavior. Show before/after token count.
```

### Ultra Mode
```
/dense ultra — rewrite this entire module.
```

---

## What Dense Coder Will NOT Do

- Give 3 approaches when 1 is right
- Add docstrings to functions that don't need them
- Comment `# increment i`
- Explain what a for loop does
- Pad responses with "Great question!" or "Here's what's happening:"
- Use `.format()` when f-strings exist
- Write `result = x; return result`

---

## IDE Workflow Tips

**Cursor / Windsurf:**  
Set Dense Coder as a system prompt rule in `.cursorrules` or `AGENTS.md`:
```
When writing or reviewing code, apply Dense Coder rules:
every line must earn its place, idiomatic code only, one best solution.
```

**VS Code + Continue / Copilot Chat:**  
Prepend the skill to your workspace context file.

**Antigravity:**  
Skill auto-loads from `~/.gemini/antigravity/skills/dense-coder/SKILL.md`.
