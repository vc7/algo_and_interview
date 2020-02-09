# 13. Roman to Integer

## 20200209

### 1

不用特別去判斷到底是不是 4 或 9 。

只要看 現在的位數 對應到的值是不是比 下一個位數 對應到的值還要小，就可以判定。

是的話就需要用減法的方式處理，例如 `IX` 是 `10 - 1` 和 `IV` 是 `5 - 1`

``` swift
class Solution {
    func romanToInt(_ s: String) -> Int {
        let symbols: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000,
        ]
        
        let original = Array(s)
        var result = 0
        var index = 0 
        
        while index < original.count {
            let current = original[index]
            let value = symbols[current] ?? 0
            var change = value
            
            if index != original.count - 1 {
                let next = original[index + 1]
                let nextValue = symbols[next] ?? 0
                if value < nextValue {
                    change = nextValue - value
                    index += 1
                }
            }
            
            result += change
            index += 1
        }
        
        return result
    }
}
```

#### Result

```
Runtime: 24 ms, faster than 95.13% of Swift online submissions for Roman to Integer.
Memory Usage: 21 MB, less than 33.33% of Swift online submissions for Roman to Integer.
```
