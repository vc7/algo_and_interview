# 674. Longest Continuous Increasing Subsequence

- <https://leetcode.com/problems/longest-continuous-increasing-subsequence/>
- 典型的 sliding window 問題

## 20200208

### 1

``` swift
class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        if nums.count < 2 { return nums.count }
        
        // Sliding window 的左側
        var start = 0
        var result = 0
        
        for index in 0..<nums.count {
            if index > 0 && nums[index] <= nums[index - 1] {
                start = max(start, index)
            }
            
            result = max(result, index - start + 1)
        }
        
        return result
    }
}
```

#### Result

```
Runtime: 72 ms, faster than 97.56% of Swift online submissions for Longest Continuous Increasing Subsequence.
Memory Usage: 21 MB, less than 100.00% of Swift online submissions for Longest Continuous Increasing Subsequence.
```

