# 5 月 LeetCode 挑戰, W2D4, Flood Fill (Find Path), in Swift

資料結構與演算法： `Hash Table`

- 挑戰頁面 - [Flood Fill](https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3326/)
- 原題目頁面 - [733. Flood Fill](https://leetcode.com/problems/flood-fill/)

## 思考方式

這題是很典型的找路徑 (find path) 題目，解題概念是 deep first search,  backtracking 。

### ① 找出 Backtracking 中單一元素的行為

找路徑的解法，就是站在一個位置的時候，會找上下左右四個方向是不是目標值。
走到其中一個方向之後，是目標值的話就在那個位置繼續往他的上下左右四個方向走。

### ② 找出 Backtracking 的停止條件

進行 backtracking 的演算法最重要的事情就是找出如何停止

- 當前的位置已經超出目前二維陣列的範圍

## 程式碼

``` swift
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let start = image[sr][sc]
        // 如果指定的起點和要替換的值一樣的話就直接回傳
        if start == newColor { return image }
        
        // 有不一樣才開始走訪尋找和替換
        var result = image
        fill(&result, start, sr, sc, newColor)
        return result
    }
    
    // Backtracking routine
    func fill(_ image: inout [[Int]], _ start: Int, _ row: Int, _ column: Int, _ newColor: Int) {
        // 結束走訪：超出範圍
        if row >= image.count || column >= image[0].count || row < 0 || column < 0 { return }
        
        let current = image[row][column]
        
        // 結束走訪：當前的數值不符合我們要找的數值就提前結束
        if current != start { return }
        
        // 替換
        image[row][column] = newColor
        
        // 依序上下左右深度走訪
        fill(&image, start, row - 1, column, newColor) // 上
        fill(&image, start, row + 1, column, newColor) // 下
        fill(&image, start, row, column - 1, newColor) // 左
        fill(&image, start, row, column + 1, newColor) // 右
    }
}
```

## 複雜度分析

設 image 為 r * c 的二維陣列。 (r for number of rows, c for number of column)

- 時間複雜度： O(r * c)
  - 最壞會全部走過一次
- 空間複雜度： O(r * c)
  - 傳入的是 immutable (不可變) 2d array ，所以需要把它轉成可變的 array 才可以變更內容。

## 執行結果

``` text
Runtime: 56 ms (beats 100.00%)
Memory Usage: 21.1 MB
```

- <https://leetcode.com/submissions/detail/337826360/?from=/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3326/>