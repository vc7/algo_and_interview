# 3. Longest Substring Without Repeating Characters

## 20200207

### 1

``` swift
class Solution {
    func lengthOfLongestSubstring(_ string: String) -> Int {
        var count = 0
        var characters = [Character]()
        
        for character in string {
            if characters.contains(character), let index = characters.firstIndex(of: character) {
                count = max(count, characters.count)
                characters.removeSubrange(0...index)
            }
            
            characters.append(character)
        }
        
        return max(count, characters.count)
    }
}
```

#### Result

```
Runtime: 80 ms, faster than 38.69% of Swift online submissions for Longest Substring Without Repeating Characters.
Memory Usage: 21.4 MB, less than 12.50% of Swift online submissions for Longest Substring Without Repeating Characters.
```
