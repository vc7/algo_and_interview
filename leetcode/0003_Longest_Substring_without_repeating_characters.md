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

加入 HashMap 的做法

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

### 3

執行時間沒有減少太多，但是比較好懂

``` swift
class Solution {
    func lengthOfLongestSubstring(_ string: String) -> Int {
        if string.count < 2 { return string.count }
        var start = 0
        var result = 0
        var characters = [Character: Int]()
        
        for (index, character) in string.enumerated() {
            if let previousIndex = characters[character], previousIndex >= start {
                start = previousIndex + 1
            }
            characters[character] = index
            result = max(result, index - start + 1)
        }
        
        return result
    }
}
```

#### Result

```
Runtime: 40 ms, faster than 76.86% of Swift online submissions for Longest Substring Without Repeating Characters.
Memory Usage: 21.3 MB, less than 12.50% of Swift online submissions for Longest Substring Without Repeating Characters.
```

### 4

不使用 enumerated 不知道為什麼速度加快很多。

``` swift
class Solution {
    func lengthOfLongestSubstring(_ string: String) -> Int {
        if string.count < 2 { return string.count }

        /// Sliding Window 窗戶的起始點
        var start = 0
        var result = 0
        var original = Array(string)
        var characters = [Character: Int]()
        
        for index in 0..<original.count {
            let current = original[index]
            if let previousIndex = characters[current] {
                start = max(previousIndex, start)
            }
            
            result = max(result, index - start + 1)
            
            // 讓下一次計算距離從出現位置的右側 1 位開始計算
            characters[current] = index + 1
        }
        
        return result
    }
}
```

#### Result

```
Runtime: 28 ms, faster than 95.07% of Swift online submissions for Longest Substring Without Repeating Characters.
Memory Usage: 21.1 MB, less than 12.50% of Swift online submissions for Longest Substring Without Repeating Characters.
```
