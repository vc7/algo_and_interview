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

### 2

雖然 memory 用量降低，但是執行速度變慢 ...

``` swift
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        // 1. 整個走訪一次，用第一行和第一列紀錄需要變成 0 的行或列記錄起來
        // 2. 根據第一行和第一列去更新第一行和第一列以外的內容
        // 3. 更新第一行和第一列
        
        var shouldFirstColumnChange = false
        var shouldFirstRowChange = false
        
        for row in 0..<matrix.count {
            if matrix[row][0] == 0 {
                shouldFirstColumnChange = true
            }
            
            for column in 0..<matrix[0].count {
                
                if row == 0 && matrix[0][column] == 0 {
                    shouldFirstRowChange = true
                }
                
                if matrix[row][column] == 0 {
                    matrix[row][0] = 0
                    matrix[0][column] = 0
                }
            }
        }
        
        for row in 1..<matrix.count {
            for column in 1..<matrix[0].count {
                if matrix[row][0] == 0 || matrix[0][column] == 0 {
                    matrix[row][column] = 0
                }
            }
        }
        
        if shouldFirstRowChange {
            for column in 0..<matrix[0].count {
                matrix[0][column] = 0
            }
        }
        
        if shouldFirstColumnChange {
            for row in 0..<matrix.count {
                matrix[row][0] = 0
            }
        }
    }
}
```

#### Result

``` text
Runtime: 128 ms, faster than 66.09% of Swift online submissions for Set Matrix Zeroes.
Memory Usage: 21.1 MB, less than 100.00% of Swift online submissions for Set Matrix Zeroes.
```
