
# 6. ZigZag Conversion

## 20200208

### 1

雖然有行內註解，詳細圖示說明候補。

``` swift
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 { return s }
        
        let original = Array(s)
        var result = [Character]()
        
        let cycleLength =  numRows * 2 - 2
        
        for row in 0..<numRows {
            var start = 0
            while start + row < original.count {
                // 取得目前位置 -> 該組的起始點 + 行數
                let current = start + row
                result.append(original[current])
                // 因為中間行在每組中會出現兩次，所以需要額外處理
                // 第一次就是前一行的，數組的起始位置 + 行數
                // 第二次就是下一組數組的起始位置 - 行數。下一組數組的起始位置可以透過 `現在的起始位置` + `一個循環的長度` 取得
                let nextStart = start + cycleLength
                let secondPosition = nextStart - row
                if row != 0 && row != numRows - 1 && secondPosition < original.count {
                    result.append(original[secondPosition])
                }
                // 將開始位置指向下一個開始位置
                start = nextStart
            }
        }
        
        return String(result)
    }
}
```

#### Result

```
Runtime: 48 ms, faster than 94.68% of Swift online submissions for ZigZag Conversion.
Memory Usage: 21.6 MB, less than 20.00% of Swift online submissions for ZigZag Conversion.
```
