# 27. Remove Element

## 20200210

### 1

用指標的方式追蹤，不需要實際把陣列的元件移除

``` swift
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count < 1 { return nums.count }
        
        var pointer = 0
        for index in 0..<nums.count {
            if nums[index] != val {
                nums[pointer] = nums[index]
                pointer += 1
            }
        }
        
        return pointer
    }
}
```

#### Result

```
Runtime: 12 ms, faster than 54.92% of Swift online submissions for Remove Element.
Memory Usage: 20.7 MB, less than 100.00% of Swift online submissions for Remove Element.
```
