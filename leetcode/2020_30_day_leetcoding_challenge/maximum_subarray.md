# Maximum SUbarray

- <https://leetcode.com/explore/featured/card/30-day-leetcoding-challenge/528/week-1/3285/>

## code

O(n) 的解法, Greedy, DP

``` swift
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }

        var local = nums
        var largest = nums[0]

        for index in 1..<local.count {
            local[index] = max(local[index], local[index - 1] + local[index])
            largest = max(largest, local[index])
        }
        return largest
    }
}
```

### Result

- <https://leetcode.com/submissions/detail/319059140/>

``` text
Runtime: 40 ms
Memory Usage: 21 MB
```
