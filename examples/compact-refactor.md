# Compact Refactor — Dense Coder Example

## Scenario

User has a Python utility function written in a "safe/verbose" style. Wants it refactored for production use — compact, idiomatic, no noise.

---

## User Prompt

```
/dense — refactor this function

def process_user_data(user_list):
    """
    Takes a list of user dictionaries and returns a filtered,
    sorted list of active users with their names uppercased.
    
    Args:
        user_list: list of dicts with 'name', 'active', 'score' keys
    Returns:
        list of dicts
    """
    result = []
    for user in user_list:
        if user['active'] == True:
            new_user = {}
            new_user['name'] = user['name'].upper()
            new_user['score'] = user['score']
            result.append(new_user)
    result_sorted = sorted(result, key=lambda x: x['score'], reverse=True)
    return result_sorted
```

---

## Dense Coder Output

```python
def process_users(users):
    return sorted(
        [{'name': u['name'].upper(), 'score': u['score']} for u in users if u['active']],
        key=lambda u: u['score'], reverse=True
    )
```

---

## What Changed

| Before | After |
|---|---|
| 20 lines | 4 lines |
| Docstring (8 lines) | Removed — signature is self-documenting |
| Manual dict construction | Dict comprehension inside list comprehension |
| `== True` comparison | Truthy check `if u['active']` |
| Intermediate `result` variable | Inline sorted() call |
| `result_sorted` temp var | Return directly |

**Token reduction: ~78%**
