# 75. Sort Colors

- <https://leetcode.com/problems/sort-colors/>

`Two Pointers`

## 思考方式

在走訪的過程，逐步把遇到的 Red 放到前面，把遇到的 Blue 放到後面

## 20200311

### 1

``` swift
class Solution {
    func sortColors(_ nums: inout [Int]) {
        var index = 0
        var redPointer = 0
        var bluePointer = nums.count - 1
        
        while index <= bluePointer {
            let current = nums[index]
            if current == 0 {
                if index != redPointer {
                    let temp = nums[redPointer]
                    nums[redPointer] = nums[index]
                    nums[index] = temp
                }
                index += 1
                redPointer += 1
            } else if current == 2 {
                if index != bluePointer {
                    let temp = nums[bluePointer]
                    nums[bluePointer] = nums[index]
                    nums[index] = temp
                }
                bluePointer -= 1
            } else {
                index += 1
            }
            
        }
    }
}
```

#### Result

``` text
Runtime: 4 ms, faster than 100.00% of Swift online submissions for Sort Colors.
Memory Usage: 20.6 MB, less than 100.00% of Swift online submissions for Sort Colors.
```
