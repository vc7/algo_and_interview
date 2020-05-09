# 5 月 LeetCode 挑戰, W2D1, Check If It Is a Straight Line (計算斜率), in Swift

資料結構與演算法： `Math`

- 挑戰頁面 - [Check If It Is a Straight Line](https://leetcode.com/explore/featured/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3323/)
- 原題目頁面 - [993. Check If It Is a Straight Line](https://leetcode.com/problems/check-if-it-is-a-straight-line/)

## 思考方式

可以沿途看 `斜率` 有沒有改變，就可以知道題目給的一連串座標是不是直線。

- 於是就可以先求出頭兩點的斜率，接著逐兩點求斜率看和第一組數組的斜率有沒有不一樣。
- 有不同就回傳 false ，順利走訪完成就可以回傳 true 。

這題有另外一個 shoelace formula 的解法，雖然不是非常的直覺，但是可以避免算斜率時分母是零的情形。這篇還是先記錄自己寫出來的第一個寫法。

## 程式碼

``` swift
class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        if coordinates.count < 2 { return true }

        // 求出第一段的斜率
        let first = slope(from: coordinates[0],to: coordinates[1])
        var current: Float = 0

        // 走訪每一個數值
        for index in 1..<(coordinates.count - 1) {
            current = slope(from: coordinates[index],to: coordinates[index + 1])
            // 有遇到不同的值就直接中斷回傳 false
            if current != first { return false }
        }

        // 如果都沒有被中斷就代表斜率都相同可以回傳 true
        return true
    }

    /// 求斜率的 helper method
    func slope(from a: [Int], to b: [Int]) -> Float {
        // 斜率公式: Δy/Δx, 分母為零就回傳無限
        return b[0] == a[0] ? .infinity : Float(b[1] - a[1]) / Float(b[0] - a[0])
    }
}
```

## 複雜度分析

n 為 coordinates 的元素個數。

- 時間複雜度： O(n)
  - 一層的 for 走訪
- 空間複雜度： O(1)
  - 常數個變數宣告

## 執行結果

``` swift
Runtime: 40 ms (beats 100%)
Memory Usage: 21.2 MB
```

- <https://leetcode.com/submissions/detail/336245352/>
