# 58. Length of Last Word

不用內建方法，而用走訪的方式在執行的速度上比較慢

## 20200311

### 1

``` swift
class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        var count = 0
        var previous: Character?
        
        for character in s {
            if character != " " {
                if previous == " " {
                    count = 0
                }
                count += 1
            }
            previous = character
        }
        return count
    }
}
```

#### Result

``` text
Runtime: 16 ms, faster than 24.56% of Swift online submissions for Length of Last Word.
Memory Usage: 20.3 MB, less than 50.00% of Swift online submissions for Length of Last Word.
```

### 2

``` swift
class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        let splited = s.split(separator: " ")
        return splited.last?.count ?? 0
    }
}
```

#### Result

``` text
Runtime: 8 ms, faster than 85.09% of Swift online submissions for Length of Last Word.
Memory Usage: 20.9 MB, less than 50.00% of Swift online submissions for Length of Last Word.
```
