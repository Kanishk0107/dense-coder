# Dense Coder — हिंदी / Hinglish Guide

> English README ke liye: [README.md](../README.md)

---

## Dense Coder kya hai?

Dense Coder ek **Claude Skill** hai jo Claude ko senior engineer jaisa code likhna sikhata hai.

Normal Claude bahut verbose hota hai — docstrings, comments, multiple approaches. Dense Coder yeh sab remove karta hai aur sirf **best solution** deta hai — kam tokens mein, zyada useful output.

---

## Token save kaise hote hain?

Normal Claude output mein ye sab hota hai jo zaruri nahi:

| Hata deta hai | Kyun |
|---|---|
| Obvious functions ke docstrings | `def add(a, b)` — explanation ki zarurat nahi |
| Useless inline comments | `i += 1  # increment i` — noise hai |
| Multiple approaches | Ek best solution do, 3 options nahi |
| Debug print statements | Clean code ships clean |
| Redundant variables | `result = x; return result` → `return x` |

**Typical savings: 40–75% tokens per function.**

---

## Kaise install karein?

### Antigravity / AI IDE mein:

`SKILL.md` file yahan copy karo:

```
Windows: C:\Users\<tumhara-naam>\.gemini\antigravity\skills\dense-coder\SKILL.md
Mac/Linux: ~/.gemini/antigravity/skills/dense-coder/SKILL.md
```

Claude restart karo. `/dense` type karo — activate ho jayega.

---

## Kaise use karein?

```
/dense — is function ko refactor karo
```

```
Review karo senior engineer ki tarah. Sirf real issues batao.
```

```
Bug fix karo. Sirf patch do. Explanation mat do.
```

```
/dense ultra — maximum compression mode
```

---

## Kab use na karein?

- Jab naya language seekh rahe ho
- Jab junior developer ke liye code likh rahe ho
- Jab theory samajhni ho, implementation nahi

---

## Example

**Verbose (17 lines):**
```python
def get_unique_words(text):
    """Returns unique sorted words from text."""
    text_lower = text.lower()
    words = text_lower.split()
    unique_words = set(words)
    result = sorted(unique_words)
    return result
```

**Dense Coder (2 lines):**
```python
def unique_words(text):
    return sorted(set(text.lower().split()))
```

Same output. ~87% kam tokens.

---

Made by [Kanishk Bhardwaj](https://github.com/Kanishk0107)
