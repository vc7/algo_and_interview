# 64. Minimum Path Sum

`Path` `DP` `Greedy`

- <https://leetcode.com/problems/minimum-path-sum/>

## 20200311

### 1

``` swift
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        
        var localGrid = grid
        
        for row in 0..<localGrid.count {
            for column in 0..<localGrid[0].count {
                if row == 0 && column == 0 { continue }
                
                if row == 0 {
                    localGrid[row][column] += localGrid[row][column - 1]
                    continue
                } else if column == 0 {
                    localGrid[row][column] += localGrid[row - 1][column]
                    continue
                }
                
                let topCost = localGrid[row - 1][column]
                let leftCost = localGrid[row][column - 1]
                let smallerCost = min(topCost, leftCost)
                
                localGrid[row][column] += smallerCost
            }
        }
        
        return localGrid[localGrid.count - 1][localGrid[0].count - 1]
    }
}
```

#### Result

``` text
Runtime: 60 ms, faster than 92.96% of Swift online submissions for Minimum Path Sum.
Memory Usage: 20.9 MB, less than 50.00% of Swift online submissions for Minimum Path Sum.
```
