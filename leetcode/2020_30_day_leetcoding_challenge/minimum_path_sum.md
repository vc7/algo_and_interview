# Minimum Path Sum

資料結構及演算法： `Dynamic Programing` `Matrix` `Greedy`

## 題目

- 挑戰頁面 - <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3303/>
- 元題目頁面 - [64. Minimum Path Sum](https://leetcode.com/problems/minimum-path-sum/)

## 思考方式

直覺是很明顯就是 DP (笑) ，個人覺得也可以算是 Greedy 吧。（有錯麻煩請指正）

回到題目本身，白話來說，就是拿前一個步驟的結果來成就目前的步驟。跟前天的那題 [Product of Array Except Self](https://qiita.com/vc7/items/ad77ffca4119d7741e92) 有類似的感覺。

首先，把範例拉小來分析：

``` text
1, 3
1, 5
```

以這個矩陣來說的話，左上到左下最小和會是 1 + 1 + 5 = 7 ，為什麼？

再縮小一點，

- 只看第一行 `1, 3`
  - 到 1 的成本是 1, 到 3 的成本是 1 + 3 = 4
- 只看第一列 `1, 1`
  - 到第一個 1 的成本是 1, 到第二個 1 的成本是 1 + 1 = 2

拉回陣列，那到 5 要怎麼判斷？到 5 的那個位置會有兩種可能：

- 1 + 3 + 5 = 9
- 1 + 1 + 5 = 7 ✅

根據題目，我們需要取最小值，所以我們會選 `7`

接著我們只要根據這個算法擴大到比較大的二維陣列即可。

## 解題步驟

用雙 loop 去走訪所有元素是必然的，接著我們根據前一小段來看每到一個位置之後要做什麼：

- (0, 0) 起點，不需要做什麼事情
- 起點以外的第一行 (row == 0) ，加上自己左邊的值再放回去
- 起點以外的第一列 (column == 0) ，加上自己上面的值再放回去
- 以上以外的位置，上面和左邊位置的值取小者和自己相加之後放回去

全部走訪完之後，在最右下角 (row.count - 1, column.count - 1) 的位置就會是從左上走到右下的最小路徑和了。

## 程式碼

``` swift
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        
        // 複製一個可變的 grid
        // Make a mutable copy of grid
        var grid = grid
        
        for row in 0..<grid.count {
            for column in 0..<grid[0].count {
                // 起點不做任何處理
                // Do nothing at origin
                if row == 0 && column == 0 { continue }
                
                // 處理第一行
                // Proccessing the first row
                if row == 0 {
                    grid[row][column] += grid[row][column - 1]
                    continue
                }
                
                // 處理第一列
                // Proccessing the first column
                if column == 0 {
                    grid[row][column] += grid[row - 1][column]
                    continue
                }
                
                // 處理以外的值
                // Proccessing the rest of the positions
                grid[row][column] += min(grid[row - 1][column],
                                         grid[row][column - 1])
            }
        }
        
        // 回傳最右下角位置的值
        // Returns the right bottom item's value
        return grid[grid.count - 1][grid[0].count - 1]
    }
}
```

## 複雜度分析

令 m 為二維陣列的寬度 (每一行的 item 數)，n 為二維陣列的高度（總共有幾行）

- 時間複雜度 - O(m * n)
  - 有 loops 來走訪每個元素
- 空間複雜度 - O(m * n)
  - 有複製一個陣列

## 執行結果

``` text
Runtime: 60 ms (beats 93.01%)
Memory Usage: 20.4 MB
```

- <https://leetcode.com/submissions/detail/326585736/?from=/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3303/>