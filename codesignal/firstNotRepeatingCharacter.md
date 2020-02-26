# firstNotRepeatingCharacter

## 20200226

- <https://app.codesignal.com/interview-practice/task/uX5iLwhc6L5ckSyNC/description>

### 1

``` swift
func firstNotRepeatingCharacter(s: String) -> Character {
    if s.isEmpty { return "_" }
    // To record the appearance
    var seenTwice = [Character: Bool]()
    // To keep the order
    var seen = [Character]()
    for c in s {
        if seenTwice[c] != nil {
            seenTwice[c] = true
        } else {
            seen.append(c)
            seenTwice[c] = false
        }
    }

    for character in seen {
        if let isTwice = seenTwice[character], !isTwice  {
            return character
        }
    }

    return "_"
}
```
