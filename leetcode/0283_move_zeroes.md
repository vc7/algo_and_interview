# 283. Move Zeroes

`Array` `Two Pointers`

- 在 [challenge](2020_30_day_leetcoding_challenge/move_zeroes.md) 有出現

## 20200405

- <https://leetcode.com/articles/move-zeroes/>

官方的第一個 approach 太浪費資源了就跳過不記了。

### 官方最佳解

Solution 裡面提到全部最佳化的解法，但是效能有點差？可能在 swap 的那一步有消耗計算資源。

``` swift
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var lastNoneZeroIndex = 0

        for index in 0..<nums.count {
            if nums[index] != 0 {
                let temp = nums[lastNoneZeroIndex]
                nums[lastNoneZeroIndex] = nums[index]
                nums[index] = temp

                lastNoneZeroIndex += 1
            }
        }
    }
}
```

#### Result - 1

- <https://leetcode.com/submissions/detail/319608718/>

``` text
Runtime: 40 ms, faster than 86.74% of Swift online submissions for Move Zeroes.
Memory Usage: 21.4 MB, less than 6.25% of Swift online submissions for Move Zeroes.
```

### 官方部分最佳化解

不知道為什麼迴圈跑兩次反而比較省時間。可能跟迴圈內做的事情相對單純有關係。

``` swift
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var lastNoneZeroIndex = 0

        for index in 0..<nums.count {
            if nums[index] != 0 {
                nums[lastNoneZeroIndex] = nums[index]
                lastNoneZeroIndex += 1
            }
        }

        for index in lastNoneZeroIndex..<nums.count {
            nums[index] = 0
        }
    }
}
```

### Result - 2

- <https://leetcode.com/submissions/detail/319604638/>

``` text
Runtime: 36 ms, faster than 98.32% of Swift online submissions for Move Zeroes.
Memory Usage: 21.5 MB, less than 6.25% of Swift online submissions for Move Zeroes.
```
