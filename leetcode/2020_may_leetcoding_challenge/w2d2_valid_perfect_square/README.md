# 5 月 LeetCode 挑戰, W2D2, Valid Perfect Square (二分搜尋 / Binary Search), in Swift

資料結構與演算法： `Binary Search`

- 挑戰頁面 - [Valid Perfect Square](https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3324/)
- 原題目頁面 - [367. Valid Perfect Square](https://leetcode.com/problems/valid-perfect-square/)

## 思考方式

題目是要求確認輸入的值是不是完全平方數

### 走到二分搜尋為止的思考步驟

- 從 1 開始一個一個取平方直到和 num 相等為止
- 但是這樣太慢，降這種線性走訪的方式就是二分搜尋了

### 二分搜尋

- 如果正中間的平方值和 num 相等就回傳
- 小於就改找右半邊，因為目前的值太小，需要找更大的值
- 大於就改找左半邊，因為目前的值太大，需要找更小的值

## 程式碼

``` swift
class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        // 題目有說只會有「正數」，所以從 1 開始
        var left = 1
        var right = num

        // 二分搜尋 binary search 為基礎的變形
        while left <= right {
            let middle = left + (right - left) / 2
            let square = middle * middle

            if square == num {
                return true
            } else if square < num {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }

        return false
    }
}
```

## 複雜度分析

n 為 num 的值。

- 時間複雜度： O(logn)
  - 即二分搜尋 binary search 的複雜度
- 空間複雜度： O(1)
  - 常數個變數宣告

## 執行結果

``` text
Runtime: 0 ms (beats 100%)
Memory Usage: 20.5 MB
```

- <https://leetcode.com/submissions/detail/336682090/?from=/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3324/>
