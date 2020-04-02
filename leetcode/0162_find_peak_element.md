# 162. Find Peak Element

`Array` `Binary Search`

- <https://leetcode.com/problems/find-peak-element>

## 關鍵

有要求 `只要有出現 O(logn)` 這個條件，所以用 Binary Tree。

## 20200402

### 1

``` swift
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1

        while left < right {
            let middle = left + (right - left) / 2
            if middle == 0 {
                return (nums[left] > nums[right]) ? left : right
            }

            if nums[middle] > nums[middle-1] && nums[middle] > nums[middle+1] {
                return middle
            } else if nums[middle] < nums[middle-1] {
                right = middle
            } else {
                left = middle + 1
            }
        }
        return left
    }
}
```

#### Result

- <https://leetcode.com/submissions/detail/318524583/>

``` text
Runtime: 24 ms, faster than 96.60% of Swift online submissions for Find Peak Element.
Memory Usage: 20.9 MB, less than 100.00% of Swift online submissions for Find Peak Element.
```
