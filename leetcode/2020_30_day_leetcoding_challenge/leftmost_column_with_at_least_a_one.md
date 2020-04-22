# Leftmost Column with at Least a One

- 挑戰頁面 - <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3306/>

雖然是看 hint 解出來的，不過還是寫一下檢討後自己的理解和解題的過程好了。

## 數組

> A binary matrix means that **all elements are 0 or 1**. For each individual row of the matrix, this row is sorted in **non-decreasing order**.

題目第一行可以看出來每一行有這樣的特性：

- 只會有 0 和 1
- 以非降冪方式排序，也就是 0 會放在一起， 1 會放在一起，而 0 的那一堆會在 1 的那一堆的左邊。

## 輸出

走過所有行，找出最左邊的 1 的位置並回傳

## 暴力解

就是逐行逐列找，不過會超過 get 的存取限制。

``` swift
class Solution {
    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
		let numberOfRows = binaryMatrix.dimensions()[0]
        let numberOfColumns = binaryMatrix.dimensions()[1]
        
        var minFound = numberOfColumns
        
        for row in 0..<numberOfRows {
            for column in 0..<numberOfColumns {
                if binaryMatrix.get(row, column) == 1 {
                    minFound = min(minFound, column)
                    if minFound == 0 { return minFound }
                    break
                }
            }
        }
        
        return minFound == numberOfColumns ? -1 : minFound
    }
}
```

## 二元搜尋 / Binary Search 的方式

為了解決暴力解一個一個找的尷尬情形，通常可以拿 binary search 來找。於是就導出這個解法。

- 二元搜尋的搜尋範圍: 0 到 {`目前 1 的最左邊位置` | `行的最後一個元素的位置`}
  - `目前 1 的最左邊位置` 的原因是，如果已經有找到的時候，接下來只要找接下來的行 (row) 有沒有比他左邊的 1 即可

針對每一行進行二元搜尋，搜尋的步驟如下：

1. 是 1 的話，就把 right 的指標移動到 middle 繼續搜尋左半邊。因為左半邊也有可能還有 1
2. 如果 middle 所在位置的值不是 1 的話，就把 left 的指標放到 middle + 1 尋找右半邊
3. 走訪完之後，把 left 記錄下來，因為如果有找到的話，一定是比原先找到的位置還要左邊，因此在更新值之前不需要判斷哪個比較小

### 程式碼

``` swift
class Solution {
    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
		let numberOfRows = binaryMatrix.dimensions()[0]
        let numberOfColumns = binaryMatrix.dimensions()[1]
        
        var minFound = numberOfColumns
        
        // 逐行走訪
        for row in 0..<numberOfRows {
            var left = 0
            var right = minFound
            
            // 如果 right - 1 的位置已經是 0 了的話這行就不繼續尋找
            if binaryMatrix.get(row, right - 1) == 0 { continue }
            
            // 二元搜尋 / binary search 的部分
            while left < right {
                // 取得中間的位置
                let middle = left + (right - left) / 2

                if binaryMatrix.get(row, middle) == 1 {
                    // 把範圍移動到左半部，繼續找左半部看有沒有 1
                    right = middle
                } else {
                    // 把範圍移動到右半部，繼續找右半部看有沒有 1
                    left = middle + 1
                }
            }
            
            minFound = left

            // 已經到底的話就直接回傳
            if minFound == 0 { return minFound }
        }
        
        // 如果 minFound 一直都是初始值的話，就回傳 -1 ，若不是就回傳 minFound
        return minFound == numberOfColumns ? -1 : minFound
    }
}
```

### 執行時間

`84 ms`, 如果沒有那些可以提早結束的判斷的話，可以縮短到 `80 ms` ，雞婆了一點好像不是好是（咦）

### 複雜度分析

令行數是 n ，列數是 m 。

- 時間複雜度： O(nlogm)
  - 走訪過所有行數是 O(n)
  - 用二元搜尋走列數是 O(logm)
  - 兩個是包在裡面的所以是相乘
- 空間複雜度： O(1)
  - 因為只有常數個的 flags

## 優化解

是 hint 2 提的建議。

這個解法看起來是雖然和二元搜尋法沒有太大的關連，不過還是有用到從二元搜尋那個解法的概念。

每一行在走訪過程的步驟如下，可以看得出來有用到二元搜尋中的概念：記憶最左邊 1 的位置，從那個位置開始往左邊找

- 最小位置先初始化為列數

1. 碰到 0 就直接換下一行
2. 碰到 1 往左找第一個 1
3. 找到 1 之後更新最小位置

因為方向是下和左，所以初始位置要從二維陣列的右上開始。

### 程式碼：

從右上開始走：

``` swift
class Solution {
    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
		let numberOfRows = binaryMatrix.dimensions()[0]
        let numberOfColumns = binaryMatrix.dimensions()[1]
        
        var row = 0
        var column = numberOfColumns - 1
        var minFound = -1
        
        while row < numberOfRows && column >= 0 {
            if binaryMatrix.get(row, column) == 0 {
                row += 1
            } else {
                minFound = column
                column -= 1
            }
        }
        
        return minFound
    }
}
```

如果覺得 while 這樣看起來很長，也可以從右下走：

``` swift
class Solution {
    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
		let numberOfRows = binaryMatrix.dimensions()[0]
        let numberOfColumns = binaryMatrix.dimensions()[1]
        
        var row = numberOfRows - 1
        var column = numberOfColumns - 1
        var minFound = -1
        
        while row >= 0 && column >= 0 {
            if binaryMatrix.get(row, column) == 0 {
                row -= 1
            } else {
                minFound = column
                column -= 1
            }
        }
        
        return minFound
    }
}
```

### 執行時間

- `80 ms` ，雖然沒有比二元搜尋法快非常多，但是在演算法上面比二元搜尋單純，也比較好瞭解多了。

### 複雜度分析

令行數是 n ，列數是 m 。

- 時間複雜度： O(n + m)
  - 由於迴圈內的 column 頂多只會跑 m 個數字因此把它寫成 + m 。
- 空間複雜度： O(1)

## 參考

後續看了很多人的解說一併放上來

- ["Leftmost Column with at Least a One" Pyhton3 Solution](https://leetcode.com/discuss/interview-question/590274/leftmost-column-with-at-least-a-one-pyhton3-solution)
- [Leftmost Column with at Least a One. Facebook interview question. Thought process from brute force to binary search. ](https://dev.to/akhilpokle/leftmost-column-with-at-least-a-one-a-common-algorithm-question-thought-process-from-brute-force-to-binary-search-4mi8)
- [30-Day LeetCoding Challenge Day 21: Leftmost Column with at Least a One](https://medium.com/2020-april-30-day-leetcoding-challenge/30-day-leetcoding-challenge-day-21-leftmost-column-with-at-least-a-one-8c30d4cd3327)