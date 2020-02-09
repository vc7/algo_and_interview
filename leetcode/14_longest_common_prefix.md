# 14. Longest Common Prefix

## 20200209

### 1

``` swift
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 { return "" }
        
        // 因為要找大家共通的 prefix 
        // 所以可以直接拿第一個位置的字串當樣本
        var prefix = strs[0]
        
        // 走訪每一個字串
        for string in strs {
            while prefix.count > 0 && !string.hasPrefix(prefix) {
                // 如果 prefix 的長度不等於 0 和 沒有在目前的字串找到這個 prefix 的話
                // 把 prefix 最後的文字移除掉
                prefix.removeLast()
            }
            
            // 長度是 0 的話就不繼續檢查了
            if prefix.count == 0 { return "" }
        }
        return prefix
    }
}
```

#### Result

```
Runtime: 16 ms, faster than 94.05% of Swift online submissions for Longest Common Prefix.
Memory Usage: 20.7 MB, less than 100.00% of Swift online submissions for Longest Common Prefix.
```

#### 參考

- [LeetCode 14. Longest Common Prefix Solution Explained - Java](https://www.youtube.com/watch?v=bl8ue-dTxgs) 
  - Leetcode Solution 的地方文字看不太下去，這個影片說明得非常清楚
