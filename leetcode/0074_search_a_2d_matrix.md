# 74. Search a 2D Matrix

- <https://leetcode.com/problems/search-a-2d-matrix/>

## 20200313

### 1

``` swift
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        for row in 0..<matrix.count {
            // 檢查內容物範圍再進入 column 的迴圈
            if let first = matrix[row].first, let last = matrix[row].last, first <= target && last >= target {
                for column in 0..<matrix[0].count {
                    if matrix[row][column] == target {
                        return true
                    }
                }
            }
        }
        
        return false
    }
}
```

#### Result

``` text
Runtime: 64 ms, faster than 98.46% of Swift online submissions for Search a 2D Matrix.
Memory Usage: 20.9 MB, less than 100.00% of Swift online submissions for Search a 2D Matrix.
```
