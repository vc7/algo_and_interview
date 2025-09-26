# 611. Valid Triangle Number

`Two Pointers` `Math`

* https://leetcode.com/problems/valid-triangle-number/description/?envType=daily-question&envId=2025-09-26

```swift
class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        guard nums.count >= 3 else { return 0 }
        let nums = nums.sorted()
        var result = 0

        for index in (2..<nums.count) {
            var left = 0
            var right = index - 1

            while left < right {
                if nums[left] + nums[right] > nums[index] {
                    result += right - left
                    right -= 1
                } else {
                    left += 1
                }
            }
        }

        return result
    }
}
```
