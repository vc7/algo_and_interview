# Weekly Contest 183

- <https://leetcode.com/contest/weekly-contest-183>

- 成績： 8
- 排名： 4503 /8786
- 語言： Swift

## 心得

只有做出兩題。熟悉的概念太少，在嘗試做 2, 3, 4 的時候都是偏向暴力解的解法。在解第一題的時候，對於是不是該排序有猶豫了一下沒有那麼有自信。

## 自己寫的原始解

### 5376. Minimum Subsequence in Non-Increasing Order

- 題目： <https://leetcode.com/contest/weekly-contest-183/problems/number-of-steps-to-reduce-a-number-in-binary-representation-to-one/>

- 結果： <https://leetcode.com/submissions/detail/319895265/>

想法：因為要取得最大值，所以在先做一次倒序排序。接著事先算出總和，逐步從 `[0]` 開始減，直到取得最大值之後結束回圈並返回。

``` swift
class Solution {
    func minSubsequence(_ nums: [Int]) -> [Int] {
        let sorted = nums.sorted(by: >)
        var sum = nums.reduce(0, +)
        var currentSum = 0
        var result = [Int]()
        var index = 0

        while currentSum <= sum  && index < sorted.count {
            let current = sorted[index]
            sum -= current
            currentSum += current
            result.append(current)
            index += 1
        }

        return result
    }
}
```

### 5377. Number of Steps to Reduce a Number in Binary Representation to One

- 題目： <https://leetcode.com/contest/weekly-contest-183/problems/number-of-steps-to-reduce-a-number-in-binary-representation-to-one/>

- 結果： <https://leetcode.com/submissions/detail/319917766/>

``` swift
class Solution {
    func numSteps(_ s: String) -> Int {
        var characters = Array(s)
        var steps = 0

        while characters.count > 1 || characters[0] != "1" {
            let last = characters[characters.count - 1]
            if last == "1" {
                var hasCarry = true
                var index = characters.count-1
                while hasCarry == true {
                    if index < 0 {
                        characters.insert("1", at: 0)
                        hasCarry = false
                    } else {
                        let current = characters[index]
                        if current == "1" {
                            characters[index] = "0"
                            hasCarry = true
                        } else {
                            characters[index] = "1"
                            hasCarry = false
                        }
                    }
                    index -= 1
                }
            } else {
                characters.removeLast()
            }
            steps += 1
        }
        return steps
    }
}
```

### 5378

- 題目： <https://leetcode.com/contest/weekly-contest-183/problems/longest-happy-string>

- 結果： <https://leetcode.com/submissions/detail/319939992/>

``` swift
class Solution {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        var items = [a, b, c] // [1,1,7] -> [1,1,5] -> [0,1,5] -> [0,1,3] -> [0,0,3]
        var results: [Character] = [] // [] -> [c,c] -> [c,c,a,c,c,b]

        // t ->  f || t = t
        while items[0] > 0 || items[1] > 0 || items[2] > 0 {
            var last = results.isEmpty ? nil : results[results.count-1] // nil -> c | a -> c
            if last != "a" && items[0] > 1 && items[0] > items[1] && items[0] > items[2] {
                results.append("a")
                results.append("a")
                last = "a"
                items[0] -= 2
            } else if last != "b" && items[1] > 1  && items[1] > items[0] && items[1] > items[2] {
                results.append("b")
                results.append("b")
                last = "b"
                items[1] -= 2
            } else if last != "c" &&  items[2] > 1 && items[2] > items[0] && items[2] > items[1]  {
                results.append("c")
                results.append("c")
                last = "c"
                items[2] -= 2
            }

            if last != "a" && items[0] == 1 {
                results.append("a")
                items[0] -= 1
                last = "a"
            } else if last != "b" && items[1] == 1 {
                results.append("b")
                items[1] -= 1
                last = "b"
            } else if last != "c" && items[2] == 1 {
                results.append("c")
                items[2] -= 1
                last = "c"
            }

            if items[1] == 0 && items[2] == 0 && items[0] > 0 && last == "a" ||
               items[0] == 0 && items[2] == 0 && items[1] > 0 && last == "b" ||
               items[0] == 0 && items[1] == 0 && items[2] > 0 && last == "c" {
                return String(results)
            }
        }

        return String(results)
    }
}
```

### 5379

- 題目： <https://leetcode.com/contest/weekly-contest-183/problems/stone-game-iii>

沒寫

## 參考解

### 第二題 - 5377

- 1404. <https://leetcode.com/problems/number-of-steps-to-reduce-a-number-in-binary-representation-to-one/>

- 神級解 - <https://leetcode.com/problems/number-of-steps-to-reduce-a-number-in-binary-representation-to-one/discuss/564287/C%2B%2BJava-O(n)>

- 其實不用實際去操作陣列。
- 要求算步數的時候，要避免去操作本體，要想應該有更快的方式可以推算結果出來。

``` swift
// https://leetcode.com/submissions/detail/320044102/
// Runtime: 8 ms, faster than 100.00% of Swift online submissions for Number of Steps to Reduce a Number in Binary Representation to One.
// Memory Usage: 21.3 MB, less than 100.00% of Swift online submissions for Number of Steps to Reduce a Number in Binary Representation to One.
class Solution {
    func numSteps(_ s: String) -> Int {
        let characters = Array(s)
        var carry = 0
        var result = 0

        // 10 -> 1 次
        // 11 -> 3 次
        //  1 -> 0 次
        // 剩餘 1 個位數不用處理，所以走訪是走到 index 1 為止
        for index in (1..<characters.count).reversed() {
            if (characters[index] == "1" && carry == 0) || (characters[index] == "0" && carry == 1) {
                // 該位數 + carry 為奇數的情形需要處理兩次
                carry = 1
                result += 2
            } else {
                // 該位數 + carry 為偶數的情形只需要處理一次
                result += 1
            }
        }
        return result + carry
    }
}
```

類似題 - [1342. Number of Steps to Reduce a Number to Zero](https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero/)

### 第四題 - 5379

DP - https://leetcode.com/problems/stone-game-iii/discuss/564260/JavaC%2B%2BPython-DP-O(1)-Space

``` swift
// https://leetcode.com/submissions/detail/320017399/
// Runtime: 1584 ms, faster than 100.00% of Swift online submissions for Stone Game III.
// Memory Usage: 21.6 MB, less than 100.00% of Swift online submissions for Stone Game III.
class Solution {
    func stoneGameIII(_ stoneValue: [Int]) -> String {
        let count = stoneValue.count
        var dp = [Int](repeating: 0, count: count+1)

        for index in (0..<count).reversed() {
            var take = 0
            var innerIndex = 0
            dp[index] = Int.min
            while innerIndex < 3 && innerIndex + index < count {
                take += stoneValue[innerIndex + index]
                dp[index] = max(dp[index], take - dp[index + innerIndex + 1])
                innerIndex += 1
            }
        }

        if dp[0] > 0 { return "Alice" }
        if dp[0] < 0 { return "Bob" }
        return "Tie"
    }
}
```

``` swift
// https://leetcode.com/submissions/detail/320023186/
// Runtime: 1636 ms, faster than 100.00% of Swift online submissions for Stone Game III.
// Memory Usage: 21.5 MB, less than 100.00% of Swift online submissions for Stone Game III.
class Solution {
    func stoneGameIII(_ stoneValue: [Int]) -> String {
        let count = stoneValue.count
        var dp = [Int](repeating: 0, count: 4)

        for index in (0..<count).reversed() {
            var take = 0
            var innerIndex = 0
            dp[index % 4] = Int.min
            while innerIndex < 3 && innerIndex + index < count {
                take += stoneValue[innerIndex + index]
                dp[index % 4] = max(dp[index % 4],
                                    take - dp[(index + innerIndex + 1) % 4])
                innerIndex += 1
            }
        }

        if dp[0] > 0 { return "Alice" }
        if dp[0] < 0 { return "Bob" }
        return "Tie"
    }
}
```
