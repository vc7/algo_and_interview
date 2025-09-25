# 120. Triangle

`DP`

## 題目

https://leetcode.com/problems/triangle/description/?envType=daily-question&envId=2025-09-19

## 文章

https://vocus.cc/article/68d55449fd897800019de1a7

## Bottom Up DP 的寫法

```swift
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var dp = triangle[triangle.count - 1]
        
        for i in stride(from: triangle.count - 2, through: 0, by: -1) {
            for j in 0..<triangle[i].count {
                // Routine:
                // 直接更新 dp[j]，選擇下一行兩個可能路徑的最小值
                dp[j] = triangle[i][j] + min(dp[j], dp[j + 1])
            }
        }
        
        return dp[0]
    }
}
```

## 高階函式

參考： https://leetcode.com/problems/triangle/solutions/7221522/swift-1-liner-0-ms-2-approaches

```swift
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        triangle
            .reversed()
            // 建立一個基底為 0 的 dummy 陣列給 bottom most row 
            .reduce(Array(repeating: 0, count: triangle.count + 1)) {
                zip(
                    $1,
                    $0.adjacentPairs().map(min)
                )
                .map(+)
            }
            .first ?? 0
    }
}
```
