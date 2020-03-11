# 63. Unique Paths II

DP, [62]() 的變形題

## 20200311

### 1

``` swift
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var grid = obstacleGrid
        
        for row in 0..<grid.count { // 走訪到 row 數
            for column in 0..<grid[0].count { // 走訪到 column 數
                let current = grid[row][column]
                if current != 1 { // 非障礙物的話就繼續判斷
                    if row == 0 && column == 0 { // (0, 0) 的話直接設成 1
                        grid[row][column] = 1
                    } else {
                        let topSolutions = (row == 0) ? 0 : grid[row - 1][column]
                        let leftSolutions = (column == 0) ? 0 : grid[row][column - 1]
                        
                        grid[row][column] = topSolutions + leftSolutions
                    }
                } else { // 是障礙物的話就設成 0
                    grid[row][column] = 0
                }
            }
        }
        
        return grid[grid.count - 1][grid[0].count - 1]
    }
}
```

#### Result

``` text
Runtime: 20 ms, faster than 80.28% of Swift online submissions for Unique Paths II.
Memory Usage: 20.7 MB, less than 100.00% of Swift online submissions for Unique Paths II.
```
