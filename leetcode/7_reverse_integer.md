# 7. Reverse Integer

## 20200208

### 1

題目中有提到 32 位元的整數，在 Swift 預設的 Int 是 64 位元整數和無法把方法定義的 Int 改成 Int32 的情形之下，因此用另外兩個參數去裝 Int32 最大最小值以避免一直需要轉換位元數。


``` swift
class Solution {
    func reverse(_ x: Int) -> Int {
        if x == 0 { return x }
        var original = x
        var result = 0
        
        let Int32max = Int(Int32.max)
        let Int32min = Int(Int32.min)
        
        while original != 0 {
            if (Int32max - original % 10) / 10 < result {
                return 0
            } else if (Int32min + original % 10) / 10 > result {
                return 0
            }
            result = result * 10 + original % 10
            original /= 10
        }
        
        return result
    }
}
```

#### Result

```
Runtime: 4 ms, faster than 97.00% of Swift online submissions for Reverse Integer.
Memory Usage: 20.7 MB, less than 9.09% of Swift online submissions for Reverse Integer.
```
