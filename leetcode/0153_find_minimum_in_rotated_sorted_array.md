# 153. Find Minimum in Rotated Sorted Array

`Rotated Array` `Binary Search`

- <https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/>

## 20200321

### 1 重構前

判斷新位置的邏輯雙層 if-else 在討論區也有出現數個

``` swift
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            var middle = left + (right - left) / 2
            
            if nums[middle] >= nums[left] {
                if nums[right] <= nums[left] {
                    left = middle + 1
                } else {
                    right = middle
                }
            } else { // middle value < left value
                if nums[right] <= nums[left] {
                    right = middle
                } else {
                    left = middle + 1
                }
            }
        }
        
        return nums[left]
    }
}
```

#### Result

``` text
Runtime: 20 ms, faster than 69.78% of Swift online submissions for Find Minimum in Rotated Sorted Array.
Memory Usage: 20.9 MB, less than 100.00% of Swift online submissions for Find Minimum in Rotated Sorted Array.
```

### 2 重構後

因為有重複出現的運算方式所以再進一步歸納簡化

``` swift
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            var middle = left + (right - left) / 2
            
            if nums[middle] >= nums[right] {
                left = middle + 1
            } else {
                right = middle
            }
        }
        
        return nums[left]
    }
}
```

#### Result

``` text
Runtime: 16 ms, faster than 95.05% of Swift online submissions for Find Minimum in Rotated Sorted Array.
Memory Usage: 20.8 MB, less than 100.00% of Swift online submissions for Find Minimum in Rotated Sorted Array.
```
