# 62. Unique Paths

## 20200311

### 1

``` swift
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        // 初始化 Grid
        var grid = [[Int]](repeating: [Int].init(repeating: 0, count: n), count: m)
        
        // 初始化第一行為 1
        for row in 0..<grid.count {
            grid[row][0] = 1
        }

        // 初始化第一列為 1
        for column in 0..<grid[0].count {
            grid[0][column] = 1
        }

        for row in 1..<grid.count {
            for column in 1..<grid[row].count {
                // 每一格的可以走方式都是 上 和 左 的和
                grid[row][column] = grid[row - 1][column] + grid[row][column - 1]
            }
        }
        
        // grid 中最右下角內的值就是結果
        return grid[m - 1][n - 1]
    }
}

/*

起始位置 (0, 0), 最後位置 (m-1, n-1)
用 dp 的方式做

[
[0, 0, 0, 0],
[0, 0, 0, 0],
[0, 0, 0, 0]
]

[
[1, 1, 1, 1],
[1, 0, 0, 0],
[1, 0, 0, 0]
]

[
[1, 1, 1, 1],
[1, 2, 3, 4],
[1, 3, 6, 10]
]

*/
```

``` text
Runtime: 4 ms, faster than 91.62% of Swift online submissions for Unique Paths.
Memory Usage: 20.8 MB, less than 50.00% of Swift online submissions for Unique Paths.
```

- 參考 - <https://www.youtube.com/watch?v=6qMFjFC9YSc>
