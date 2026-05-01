# Dense Coder Philosophy

## The Problem With AI Code

AI coding assistants are calibrated for the median user.

The median user is learning. They need docstrings. They need `# increment i`. They need three approaches because they don't know which to pick.

You are not the median user.

When you've been writing code for years, verbose AI output is friction. You spend time reading through explanations you didn't need to get to the 4 lines you actually wanted. You delete more than you keep.

Dense Coder flips the default.

---

## The Core Rule

```
Every line must earn its place.
```

This applies to code, comments, docstrings, variable names, error messages, and responses.

A line that does not change behavior, improve readability, or communicate non-obvious intent should not exist.

---

## What "Idiomatic Code IS the Comment" Means

When code is written correctly in a language, it explains itself.

```python
# Verbose
words = text.lower().split()
unique_words = set(words)
result = sorted(unique_words)
return result

# Idiomatic — the comprehension IS the explanation
return sorted(set(text.lower().split()))
```

A developer reading the second version doesn't need a comment. They know what `sorted(set(...))` does. The comment would be noise.

Dense Coder defaults to idiomatic. If the idiomatic version becomes unreadable — if it's genuinely confusing — one step back is taken. But the threshold is high.

---

## Why One Solution

AI assistants default to hedging. "You could use X, or alternatively Y, or if you need Z then W."

This is a failure mode. The assistant doesn't know your codebase, so it covers all bases.

Dense Coder makes a decision. It picks the best solution for the stated problem and gives you that. If the decision is wrong, you say so. That's a faster feedback loop than reading three options and choosing yourself.

---

## The 30-Year Veteran Mental Model

A 30-year engineer reviewing your PR doesn't explain what a for loop does. They don't write docstrings for `def add(a, b)`. When they find a bug, they say "line 47, off-by-one on the slice, fix:" and show the patch.

Dense Coder applies this mental model to AI output.

It doesn't make Claude less capable. It makes Claude less verbose. The knowledge is still there — it just surfaces as signal instead of narration.

---

## Correctness Over Brevity

Dense Coder has one non-negotiable: **never break correctness for brevity**.

Compression that changes behavior is a bug. Compression that makes code confusing past a reasonable threshold is bad engineering.

The guardrails:
- Never minify (`a=1;b=2;c=3` on one line is not dense, it's unreadable)
- Never drop necessary error handling
- Never remove security-critical code or comments
- If the dense version is genuinely confusing, back off one level

The goal is clean production code, not code golf.

---

## Signal-to-Noise Ratio

Every response has a signal-to-noise ratio.

Signal: the code, the bug diagnosis, the tradeoff, the patch.  
Noise: the explanation of what the code does, the alternatives you didn't ask for, the opening pleasantry.

Dense Coder maximizes signal. It treats developer time as valuable.

---

## When to Turn It Off

Dense Coder is not always right.

- Learning something new → turn it off, get the explanation
- Onboarding a junior → turn it off, they need the docstrings
- Writing public-facing documentation → turn it off, clarity > brevity
- Deep theory → turn it off, understanding matters more than compression

`/dense off` reverts to standard Claude. Use the right tool for the context.
