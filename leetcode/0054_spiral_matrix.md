# 54. Spiral Matrix

## 20200222

### 1

分成四個部分依序進行

1. 左到右
2. 上到下
3. 右到左
4. 下到上

``` swift
class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        if matrix.isEmpty { return result }
        
        var rowBegin = 0
        var rowEnd = matrix.count - 1
        
        var columnBegin = 0
        var columnEnd = matrix[0].count - 1
        
        while rowBegin <= rowEnd && columnBegin <= columnEnd {
            traverseFromLeftToRight(result: &result, matrix: matrix, begin: columnBegin, end: columnEnd, at: &rowBegin)
            traverseFromTopToBottom(result: &result, matrix: matrix, begin: rowBegin, end: rowEnd, at: &columnEnd)
            
            if rowBegin <= rowEnd {
                traverseFromRightToLeft(result: &result, matrix: matrix, begin: columnBegin, end: columnEnd, at: &rowEnd)
            }
            
            if columnBegin <= columnEnd {
                traverseFromBottomToTop(result: &result, matrix: matrix, begin: rowBegin, end: rowEnd, at: &columnBegin)
            }
        }
        
        return result
    }
    
    func traverseFromLeftToRight(result: inout [Int], matrix: [[Int]], begin: Int, end: Int, at row: inout Int) {
        if begin > end { return }
        for column in begin...end {
            result.append(matrix[row][column])
        }
        row += 1
    }
    
    func traverseFromTopToBottom(result: inout [Int], matrix: [[Int]], begin: Int, end: Int, at column: inout Int) {
        if begin > end { return }
        for row in begin...end {
            result.append(matrix[row][column])
        }
        column -= 1
    }
    
    func traverseFromRightToLeft(result: inout [Int], matrix: [[Int]], begin: Int, end: Int, at row: inout Int) {
        if begin > end { return }
        for column in (begin...end).reversed() {
            result.append(matrix[row][column])
        }
        row -= 1
    }
    
    func traverseFromBottomToTop(result: inout [Int], matrix: [[Int]], begin: Int, end: Int, at column: inout Int) {
        if begin > end { return }
        for row in (begin...end).reversed() {
            result.append(matrix[row][column])
        }
        column += 1
    }
}
```

#### Result

```
Runtime: 4 ms, faster than 89.43% of Swift online submissions for Spiral Matrix.
Memory Usage: 21 MB, less than 100.00% of Swift online submissions for Spiral Matrix.
```
