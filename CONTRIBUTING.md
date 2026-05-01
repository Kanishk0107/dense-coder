# Contributing to Dense Coder

Keep it consistent with the philosophy: **compact, useful, no bloat.**

---

## What's Welcome

- New language idiom patterns (Go, Rust, SQL, Shell, etc.)
- Before/after examples with token counts
- Bug fixes to existing examples (incorrect code, misleading patterns)
- Cleaner docs (shorter is better)
- IDE workflow recipes (Cursor, Windsurf, VS Code integrations)

---

## What's Not Welcome

- Motivational content / "AI is amazing" framing
- Examples without before/after comparison
- Docs that are longer than what they explain
- Duplicate patterns already covered in `SKILL.md`
- Token-saving claims without evidence

---

## PR Format

Every PR should include:

1. **What changed** — one line
2. **Why** — one line
3. **Before/After** — required for example PRs

Example PR title: `Add Go idiom patterns — goroutine + channel patterns`

---

## Example Contributions

If submitting a new example to `examples/`, follow this structure:

```markdown
## Scenario
[one sentence]

## User Prompt
[exact prompt with code]

## Dense Coder Output
[compact output]

## What Changed
[table or bullet list]
```

---

## Issues

Use issues to:
- Report incorrect examples (wrong output, breaking behavior)
- Request missing language patterns
- Suggest IDE workflow recipes

Don't use issues for general Claude questions.

---

## Local Test

Before submitting, verify your example actually produces dense output in Claude with `/dense` active. Include confirmation in your PR.
