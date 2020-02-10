# 29. Divide Two Integers

``` swift
class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == Int32.min && divisor == -1 {
            return Int(Int32.max)
        }
        
        let _divisor = abs(divisor)
        var _dividend = abs(dividend)
        var result = 0
        
        while _dividend - _divisor >= 0 {
            var pow = 0
            while _dividend - ((_divisor<<1)<<pow) >= 0 {
                pow += 1
            }
            result += 1<<pow
            _dividend -= _divisor<<pow
        }
        return (dividend < 0)==(divisor < 0) ? result : -result
    }
}
```

#### Result

```
Runtime: 4 ms, faster than 96.97% of Swift online submissions for Divide Two Integers.
Memory Usage: 20.9 MB, less than 100.00% of Swift online submissions for Divide Two Integers.
```
