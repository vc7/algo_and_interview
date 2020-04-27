# Longest Common Subsequence

``` swift
// https://leetcode.com/submissions/detail/330744121/?from=/explore/challenge/card/30-day-leetcoding-challenge/531/week-4/3311/
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var long = text1.count > text2.count ? Array(text1) : Array(text2)
        var short = text1.count > text2.count ? Array(text2) : Array(text1)
        
        // 初始化 dp table 很花時間
        var dpTable = [[Int]](repeating: [Int](repeating: 0, count: short.count), count: long.count)
        for row in 0..<long.count {
            for column in 0..<short.count {
                if long[row] == short[column] {
                    dpTable[row][column] = 1 + (row == 0 || column == 0 ? 0 : dpTable[row - 1][column - 1])
                } else {
                    dpTable[row][column] = max(
                        row == 0 ? 0 : dpTable[row - 1][column],    /* up */
                        column == 0 ? 0 : dpTable[row][column - 1]) /* left */
                }
            }
        }
        
        print(dpTable)
        
        return dpTable[long.count - 1][short.count - 1]
    }
}
```

``` swift
// https://leetcode.com/submissions/detail/330745985/?from=/explore/challenge/card/30-day-leetcoding-challenge/531/week-4/3311/
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var long = text1.count > text2.count ? Array(text1) : Array(text2)
        var short = text1.count > text2.count ? Array(text2) : Array(text1)
        
        var dpArray = [Int]()
        
        for row in 0..<long.count {
            var dpRow = [Int]()
            for column in 0..<short.count {
                if long[row] == short[column] {
                    dpRow.append(1 + (row == 0 || column == 0 ? 0 : dpArray[column - 1]))
                } else {
                    dpRow.append(max(
                        row == 0 ? 0 : dpArray[column],    /* up */
                        column == 0 ? 0 : dpRow[column - 1]) /* left */
                    )
                }
            }
            dpArray = dpRow
        }
        
        return dpArray.last ?? 0
    }
}
```

``` swift
// https://leetcode.com/submissions/detail/330746522/?from=/explore/challenge/card/30-day-leetcoding-challenge/531/week-4/3311/
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var long = text1.count > text2.count ? Array(text1) : Array(text2)
        var short = text1.count > text2.count ? Array(text2) : Array(text1)
        
        // 不事先初始化可以省時間
        var dpArray = [Int]()
        var row = 0
        
        // 用 while ，不過似乎沒差
        while row < long.count {
            // 不事先初始化可以省時間
            var dpRow = [Int]()
            var column = 0
            while column < short.count {
                if long[row] == short[column] {
                    dpRow.append(1 + (row == 0 || column == 0 ? 0 : dpArray[column - 1]))
                } else {
                    dpRow.append(max(
                        row == 0 ? 0 : dpArray[column],    /* up */
                        column == 0 ? 0 : dpRow[column - 1]) /* left */
                    )
                }
                column += 1
            }
            dpArray = dpRow
            row += 1
        }
        
        return dpArray.last ?? 0
    }
}
```

- 逐步說明影片： <https://www.youtube.com/watch?v=ASoaQq66foQ>