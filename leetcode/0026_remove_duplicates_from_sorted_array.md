# 26. Remove Duplicates from Sorted Array

## 20200210

### 1

從後面走

``` swift
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 2 { return nums.count }
        for index in (0..<(nums.count - 1)).reversed() {
            let current = nums[index]
            let next = nums[index + 1]
            
            if current == next {
                nums.remove(at: index)
            }
        }
        return nums.count
    }
}
```

#### Result

```
Runtime: 84 ms, faster than 54.70% of Swift online submissions for Remove Duplicates from Sorted Array.
Memory Usage: 21.3 MB, less than 25.00% of Swift online submissions for Remove Duplicates from Sorted Array.
```
