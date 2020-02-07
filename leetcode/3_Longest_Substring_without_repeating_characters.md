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

### 2

``` swift
class Solution {
    func lengthOfLongestSubstring(_ string: String) -> Int {
        if string.count < 2 { return string.count }
        var longest = 0
        var result = 0
        /// [the character: index of the latest appeared]
        var characters = [Character: Int]()
        
        for (index, character) in string.enumerated() {
            longest += 1
            if let previousIndex = characters[character] {
                let distance = index - previousIndex
                if distance < longest {
                    longest = distance
                }
            }
            characters[character] = index
            
            if longest > result {
                result = longest
            }
        }
        
        return result
    }
}
```

#### Result

```
Runtime: 40 ms, faster than 76.86% of Swift online submissions for Longest Substring Without Repeating Characters.
Memory Usage: 21.2 MB, less than 12.50% of Swift online submissions for Longest Substring Without Repeating Characters.
```
