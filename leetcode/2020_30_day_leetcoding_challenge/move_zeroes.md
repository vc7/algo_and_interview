# Move Zeroes

- <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3286/>

## Code - 1

用雙迴圈試著解，不過效率差

``` swift
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count <= 1 { return }

        for index in 0..<(nums.count - 1) {
            var pointer = index + 1
            while nums[index] == 0 && pointer < nums.count {
                if nums[pointer] == 0 {
                    pointer += 1
                } else {
                    nums[index] = nums[pointer]
                    nums[pointer] = 0
                }
            }
        }
    }
}
```

### Result - 1

- <https://leetcode.com/submissions/detail/319591054/>
- beats 5.7%

``` text
Runtime: 132 ms
Memory Usage: 21.3 MB
```

## Code - 2

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
