# 50. Pow(x, n)

## 20200210

### 1

``` swift
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
        
        let half = myPow(x, n / 2)
        
        if n % 2 == 0 {
            return half * half
        } else {
            if n > 0 {
                return half * half * x
            } else {
                return (half * half) / x
            }
        }
    }
}
```

#### Result

```
Runtime: 8 ms, faster than 64.84% of Swift online submissions for Pow(x, n).
Memory Usage: 20.5 MB, less than 33.33% of Swift online submissions for Pow(x, n).
```
