# 33. Search in Rotated Sorted Array

`Rotated Sorted Array` `Binary Search`

- <https://leetcode.com/problems/search-in-rotated-sorted-array/>

## 20200321

### 1

``` swift
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty { return -1 }
        
        // 1. use binary search to find the pivot
        
        var start = 0 
        var end = nums.count - 1
        
        while start < end {
            let mid = start + (end - start) / 2
            if nums[mid] > nums[end] {
                start = mid + 1
            } else {
                end = mid
            }
        }
        
        let pivot = start
        
        // 2. use the pivot to decide the side
        
        start = 0
        end = nums.count - 1
        
        if target >= nums[pivot] && target <= nums[end] {
            start = pivot
        } else {
            end = pivot
        }
        
        // 3. use binary search to find the target
        
        while start <= end {
            let mid = start + (end - start) / 2
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        
        return -1
    }
}
```

#### Result

``` text
Runtime: 20 ms, faster than 69.52% of Swift online submissions for Search in Rotated Sorted Array.
Memory Usage: 20.9 MB, less than 16.67% of Swift online submissions for Search in Rotated Sorted Array.
```
