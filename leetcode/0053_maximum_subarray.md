# 53. Maximum Subarray

`Greedy` `Dynamic Programming`

- <https://www.youtube.com/watch?v=tinz1fiYv0c>

## 20200210

### 1

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

``` text
Runtime: 40 ms, faster than 68.67% of Swift online submissions for Maximum Subarray.
Memory Usage: 21.2 MB, less than 16.67% of Swift online submissions for Maximum Subarray.
```

### 2

其實不需要把 sum 放進 array 裡面，只需要保存最後一個和即可

``` swift
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }

        var largest = nums[0]
        var current = nums[0]

        for index in 1..<nums.count {
            current = max(nums[index], current + nums[index])
            largest = max(largest, current)
        }
        return largest
    }
}
```

#### Result

``` text
Runtime: 36 ms, faster than 93.08% of Swift online submissions for Maximum Subarray.
Memory Usage: 21 MB, less than 16.67% of Swift online submissions for Maximum Subarray.
```
