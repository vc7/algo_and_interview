# 28. Implement strStr()

## 20200210

### 1

``` swift
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count < 1 { return 0 }
        let needleCharacters = Array(needle)
        let haystackCharacters = Array(haystack)
        
        var start = 0
        var moving = 0
        
        while start < haystackCharacters.count && moving < needleCharacters.count && start + moving < haystackCharacters.count {
            if haystackCharacters[start + moving] == needleCharacters[moving] {
                if moving == needleCharacters.count - 1 {
                    return start
                }
                moving += 1
            } else {
                start += 1
                moving = 0
            }
        }
        
        if moving - 1 == needleCharacters.count - 1 {
            return start
        }
        
        return -1
    }
}
```

#### Result

```
Runtime: 12 ms, faster than 78.44% of Swift online submissions for Implement strStr().
Memory Usage: 20.5 MB, less than 100.00% of Swift online submissions for Implement strStr().
```

### 2

迴避掉不需要檢查的情境

``` swift
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count < 1 { return 0 }
        if needle.count > haystack.count { return -1 }
        
        let needleCharacters = Array(needle)
        let haystackCharacters = Array(haystack)
        
        var start = 0
        var moving = 0
        
        while start < haystackCharacters.count
            && moving < needleCharacters.count
            && start + moving < haystackCharacters.count {
                
            if haystackCharacters[start + moving] == needleCharacters[moving] {
                if moving == needleCharacters.count - 1 {
                    return start
                }
                moving += 1
            } else {
                start += 1
                moving = 0
            }
        }
        
        if moving - 1 == needleCharacters.count - 1 {
            return start
        }
        
        return -1
    }
}
```

#### Result

```
Runtime: 8 ms, faster than 94.95% of Swift online submissions for Implement strStr().
Memory Usage: 20.6 MB, less than 100.00% of Swift online submissions for Implement strStr().
```
