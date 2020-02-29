# 59. Spiral Matrix II

- <https://leetcode.com/problems/spiral-matrix-ii/>

## 20200229

### 1

``` swift
class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        if n == 0 { return [[]] }
        var result: [[Int]] = {
            let inner = [Int](repeating: 0, count: n)
            let outer = [[Int]](repeating: inner, count: n)
            return outer
        }()
        
        var rowBegin = 0
        var rowEnd = n - 1
        var columnBegin = 0
        var columnEnd = n - 1
        
        var count = 1
        
        while rowBegin <= rowEnd && columnBegin <= columnEnd {
            for column in columnBegin...columnEnd {
                result[rowBegin][column] = count
                count += 1
            }
            
            rowBegin += 1
            
            if columnBegin <= columnEnd && rowBegin <= rowEnd {
                for row in rowBegin...rowEnd {
                    result[row][columnEnd] = count
                    count += 1
                }
            }
            
            columnEnd -= 1
            
            if columnBegin <= columnEnd && rowBegin <= rowEnd {
                for column in (columnBegin...columnEnd).reversed() {
                    result[rowEnd][column] = count
                    count += 1
                }                
            }
            
            rowEnd -= 1
            
            if columnBegin <= columnEnd && rowBegin <= rowEnd {
                for row in (rowBegin...rowEnd).reversed() {
                    result[row][columnBegin] = count
                    count += 1
                }
            }
            
            columnBegin += 1
        }
        
        
        return result
    }
}
```

#### Result

``` text
Runtime: 8 ms, faster than 84.09% of Swift online submissions for Spiral Matrix II.
Memory Usage: 21.1 MB, less than 100.00% of Swift online submissions for Spiral Matrix II.
```
