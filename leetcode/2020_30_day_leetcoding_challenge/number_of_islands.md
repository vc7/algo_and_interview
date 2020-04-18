# Number of Islands

演算法及資料結構： `Path Finding` `Depth First Search` `Matrix`

## 題目

- 挑戰頁面 - <https://leetcode.com/explore/featured/card/30-day-leetcoding-challenge/530/week-3/3302/>
- 題目原頁面 - [200. Number of Islands](https://leetcode.com/problems/number-of-islands/solution/) 

## 想法

單用 path finding 只能找出 1 的區塊無法走訪所有的元素，所以還是必須要有雙層 for loop 來協助逐項走訪。雖然每個元素可能會被走訪到多次，但是在這樣的做法中這也沒有辦法，算是必要之惡。

簡要說明如下，其他在程式碼裡面以註解輔助說明。

- for loop
  - 逐一走訪，如果是探訪過或是是 0 的元素就跳過
- Path finding 的部分
  - 上下左右（順序可以自己指定）探索下一個是 1 還是 0 ， 1 就遞迴重複同樣的動作， 0 就停止遞迴。
  - 一個方向發現沒有沒有路走之後，就繼續檢查下一個方向有沒有路可以走，直到四個方向都探索過。
  - 逐步說明可以參考這個影片 https://www.youtube.com/watch?v=W9F8fDQj7Ok
- 記錄有探訪過的位置
  - 用一個 seen 的二維陣列來記錄已經拜訪過的位置

## 程式碼

``` swift
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        var count = 0
        var seen = [[Bool]](repeating: [Bool](repeating: false, count: grid[0].count), count: grid.count)
        
        var row = 0
        var column = 0
        
        for row in 0..<grid.count {
            for column in 0..<grid[0].count {
                // 如果沒走過的話才去探索
                if !seen[row][column] {
                    seen[row][column] = true
                    // 如果是 1 才繼續往深探索
                    if grid[row][column] == "1" {
                        count += 1
                        findLand(grid, &seen, row, column)
                    }
                }
            }
        }
        
        return count
    }
    
    func findLand(_ grid: [[Character]], _ seen: inout [[Bool]], _ row: Int, _ column: Int) {
        seen[row][column] = true
        
        // 如果發現 0 則不繼續執行，結束遞迴
        if grid[row][column] == "0" {
            return
        }
        
        // 檢查右邊的元素。如果 column 加 1 後沒有超過範圍以及 column 加 1 後的元素還沒拜訪過才進入遞迴。
        if column + 1 < grid[0].count && !seen[row][column + 1] {
            findLand(grid, &seen, row, column + 1)
        }
        
        // 檢查下面的元素。如果 row 加 1 後沒有超過範圍以及 row 加 1 後的元素還沒拜訪過才進入遞迴。
        if row + 1 < grid.count && !seen[row + 1][column] {
            findLand(grid, &seen, row + 1, column)
        }
        
        // 檢查左邊的元素。如果 column 減 1 後沒有超過範圍以及 column 減 1 後的元素還沒拜訪過才進入遞迴。
        if column - 1 >= 0 && !seen[row][column - 1] {
            findLand(grid, &seen, row, column - 1)
        }
        
        // 檢查上面的元素。如果 row 減 1 後沒有超過範圍以及 row 減 1 後的元素還沒拜訪過才進入遞迴。
        if row - 1 >= 0 && !seen[row - 1][column] {
            findLand(grid, &seen, row - 1, column)
        }
    }
}
```

## 複雜度分析

令 m 為二維陣列的寬度 (每一行的 item 數)，n 為二維陣列的高度（總共有幾行）

- 時間複雜度： O(m * n)
  - 雖然 path finding 或稱 dfs 有自己的時間複雜度，但是 m * n 會是最高階所以保留他
- 空間複雜度： O(m * n)
  - 用來記錄有走過的位置

## 執行結果

``` text
Runtime: 172 ms (beats 98.77%)
Memory Usage: 21.6 MB
```

- <https://leetcode.com/submissions/detail/326434201/?from=/explore/featured/card/30-day-leetcoding-challenge/530/week-3/3302/>

## 測試案例

```
[["1","1","1"],["0","1","0"],["1","1","1"]]
[["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]
[["1","1","1","0"],["0","0","1","0"],["0","0","0","1"]]
[["1","1","1","0"],["0","0","1","0"],["0","0","1","1"]]
[]
[[]]
```

## 後記

解完之後，雖然看到很多人的解法都是把 grid 複製（^）之後，走訪過後的元素改成 0 標示成已經走訪，但是個人在這題覺得把「水」和「走訪過」用同一個方式表現不是很好的習慣，所以後來還是決定留著原本的寫法。

^: Swift 無法直接對 parameter 傳進來的值變動，所以一定要複製一個。