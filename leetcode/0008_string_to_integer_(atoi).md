# 8. String to Integer (atoi)

- atoi = ascii to integer

## 20200208

### 1

if else 太多惹

``` swift
class Solution {
    func myAtoi(_ str: String) -> Int {
        let int32Max = Int(Int32.max)
        let int32Min = Int(Int32.min)
        let original = Array(str)
        
        var isNegative = false
        var isStarted = false
        var result = 0
        
        for index in 0..<original.count {
            let current = String(original[index])
            
            if let number = Int(current) {
                isStarted = true
                result = result * 10 + number
                if !isNegative && result > int32Max {
                    return int32Max
                } else if isNegative && -result < int32Min {
                    return int32Min
                }
            } else if current == "-" {
                if isStarted { break }
                isNegative = true
                isStarted = true
            } else if current == "+" {
                if isStarted { break }
                isNegative = false
                isStarted = true
            } else if current == " " {
                if isStarted {
                    break
                }
            } else {
                if result == 0 {
                    return 0 
                } else {
                    break
                }
            }
        }
        
        if isNegative {
            return -result
        } else {
            return result
        }
    }
}
```

#### Result

```
Runtime: 8 ms, faster than 99.24% of Swift online submissions for String to Integer (atoi).
Memory Usage: 21.2 MB, less than 25.00% of Swift online submissions for String to Integer (atoi).
```
