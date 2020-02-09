20. Valid Parentheses

## 20200209

### 1

用 Stack 方式解題

``` swift
class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        var pairs: [Character: Character] = [")": "(", "]": "[", "}": "{"]
        
        for character in s {
            switch character {
                case "(", "[", "{": 
                  stack.append(character)
                default:
                  if stack.isEmpty { return false }
                  let last = stack.removeLast()
                  if last != pairs[character]! {
                      return false
                  }
            }
        }
        
        return stack.isEmpty
    }
}
```

#### Result

```
Runtime: 8 ms, faster than 78.33% of Swift online submissions for Valid Parentheses.
Memory Usage: 20.5 MB, less than 14.29% of Swift online submissions for Valid Parentheses.
```
