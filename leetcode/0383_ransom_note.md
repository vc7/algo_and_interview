# 383. Ransom Note

## 20200229

### 1

``` swift
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var ransomFrequency = [Character: Int]()
        
        for character in ransomNote {
            let count = (ransomFrequency[character] ?? 0) + 1
            ransomFrequency[character] = count
        }
        
        for character in magazine {
            if let original = ransomFrequency[character] {
                let count = original - 1
                if count <= 0 {
                    ransomFrequency[character] = nil
                    
                    // 扣完的話就可以提早離場
                    if ransomFrequency.isEmpty {
                        return true
                    }
                } else {
                    ransomFrequency[character] = count
                }
            }
        }
        
        return ransomFrequency.isEmpty
    }
}
```

#### Result

``` text
Runtime: 32 ms, faster than 100.00% of Swift online submissions for Ransom Note.
Memory Usage: 21 MB, less than 100.00% of Swift online submissions for Ransom Note.
```
