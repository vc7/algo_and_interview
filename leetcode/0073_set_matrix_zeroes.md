# 73. Set Matrix Zeroes

- <https://leetcode.com/problems/set-matrix-zeroes/>

## 20200312

### 1

用 HashMap 試著解

``` swift
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var rows = Set<Int>()
        var columns = Set<Int>()
        
        for row in 0..<matrix.count {
            for column in 0..<matrix[0].count {
                if matrix[row][column] == 0 {
                    rows.insert(row)
                    columns.insert(column)
                }
            }
        }
        
        for row in rows {
            for column in 0..<matrix[0].count {
                matrix[row][column] = 0
            }
        }
        
        for column in columns {
            for row in 0..<matrix.count {
                matrix[row][column] = 0
            }
        }
    }
}
```

#### Result

``` text
Runtime: 128 ms, faster than 66.09% of Swift online submissions for Set Matrix Zeroes.
Memory Usage: 21.2 MB, less than 100.00% of Swift online submissions for Set Matrix Zeroes.
```
