# 53. Maximum Subarray

## 20200210

### 1.

Dynamic Programming

``` swift
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count < 1 { return 0 }
        if nums.count == 1 { return nums[0] }
        var largest = nums[0]
        var sums = [nums[0]]
        
        for index in 1..<nums.count {
            sums.append(max(nums[index], sums[index-1] + nums[index]))
            largest = max(largest, sums[index])
        }
        
        
        return largest
    }
}
```

#### Result

```
Runtime: 40 ms, faster than 68.67% of Swift online submissions for Maximum Subarray.
Memory Usage: 21.2 MB, less than 16.67% of Swift online submissions for Maximum Subarray.
```
