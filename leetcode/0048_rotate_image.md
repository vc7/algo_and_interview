# 48. Rotate Image

## 20200210

### 1

- 分成兩個步驟處理：先對角調換再水平調換
- https://www.youtube.com/watch?v=SA867FvqHrM

``` swift
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let numberOfRows = matrix.count
        
        // Flip sysmmetrically
        // 只處理對角線右上的數值
        for row in 0..<numberOfRows {
            for column in row..<numberOfRows {
                let temp = matrix[row][column]
                matrix[row][column] = matrix[column][row]
                matrix[column][row] = temp
            }
        }
        
        // Flip horizontally
        // 每一行只處理到中間點 (numberOfRows/2) ，進行中間先左右調換
        for row in 0..<numberOfRows {
            for column in 0..<(numberOfRows/2) {
                let newColumn = numberOfRows - 1 - column
                let temp = matrix[row][column]
                matrix[row][column] = matrix[row][newColumn]
                matrix[row][newColumn] = temp
            }
        }
    }
}
```

#### Result

```
Runtime: 12 ms, faster than 91.56% of Swift online submissions for Rotate Image.
Memory Usage: 20.9 MB, less than 100.00% of Swift online submissions for Rotate Image.
```
