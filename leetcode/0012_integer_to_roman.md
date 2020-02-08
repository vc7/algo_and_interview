# 12. Integer to Roman

## 20200209

### 1

``` swift
class Solution {
    func intToRoman(_ num: Int) -> String {
        let symbols = ["M", "D", "C", "L", "X", "V", "I"]
        let values = [1000, 500, 100, 50, 10, 5, 1]
        
        var result = ""
        
        var number = num
        var index = 0
        
        while index < values.count {
            var count = number / values[index]
            number = number % values[index]
            
            if index != 0 {
                // handlings for 5, 4, 9
                if count == 9 {
                    result.append(symbols[index])
                    result.append(symbols[index - 2])
                    count = 0
                }
                
                if count == 4 {
                    result.append(symbols[index])
                    result.append(symbols[index - 1])
                    count = 0
                }
                
                if count >= 5 {
                    result.append(symbols[index - 1])
                    count -= 5
                }
                
                if count < 4 && count > 0 {
                    for _ in 0..<count { result.append(symbols[index]) }
                }
            } else {
                for _ in 0..<count { result.append(symbols[index]) }
            }
            
            index += 2
        }
        
        return result
    }
}
```

#### Result

```
Runtime: 20 ms, faster than 95.06% of Swift online submissions for Integer to Roman.
Memory Usage: 20.6 MB, less than 100.00% of Swift online submissions for Integer to Roman.
```
