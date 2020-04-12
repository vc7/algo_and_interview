# 4. Median of Two Sorted Arrays

`Array` `Binary Search` `Divide and Conquer`

## 20200409

### 1

``` swift
class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let count = nums1.count + nums2.count
        var end = count / 2
        var isEven = count % 2 == 0

        var nums1Pointer = 0
        var nums2Pointer = 0
        var median = 0

        while end >= 0 {
            if nums1Pointer < nums1.count && (nums2Pointer >= nums2.count || nums1[nums1Pointer] < nums2[nums2Pointer]) {
                if souldAdd(end: end, isEven: isEven) {
                    median += nums1[nums1Pointer]
                }
                nums1Pointer += 1
            } else if nums2Pointer < nums2.count {
                if souldAdd(end: end, isEven: isEven) {
                    median += nums2[nums2Pointer]
                }
                nums2Pointer += 1
            }
            end -= 1
        }

        return isEven ? Double(median) / 2.0 : Double(median)
    }

    func souldAdd(end: Int, isEven: Bool) -> Bool {
        return (end == 0 && !isEven) || ((end == 1 || end == 0) && isEven)
    }
}
```

#### 複雜度分析

因此沒有符合題目的需求

- 時間複雜度： O(m+n)
- 空間複雜度： O(1)

#### Result

- <https://leetcode.com/submissions/detail/321909879/>

``` text
Runtime: 84 ms, faster than 92.41% of Swift online submissions for Median of Two Sorted Arrays.
Memory Usage: 21.4 MB, less than 33.33% of Swift online submissions for Median of Two Sorted Arrays.
```

### 2

- <https://leetcode.com/articles/median-of-two-sorted-arrays/>
