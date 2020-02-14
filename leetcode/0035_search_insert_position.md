# 35. Search Insert Position

## 20200214

### 1

``` swift
class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var isLarger = false
        
        for (index, num)  in nums.enumerated() {
            if num == target {
                return index
            } else {
                isLarger = num > target
                if isLarger {
                    return index
                }
            }
        }
        
        return nums.count   
    }
}

/*

Input

*Sorted* array, no duplicates
target value

Output

index of target
not found -> the index you want to inserted in


*/

/*

[1, 3, 5, 6] 6
 *

1. traverse the array 
2. compare each element with the target
   1. return if equal
   --if not found---
   2. continue the loop if smaller than the target
   3. return the index that started to become larger than the target 
--- loop end -> it means all of the items are smaller than the target, and need to append to the tail of the array
*/

```

#### Result

```
Runtime: 32 ms, faster than 88.24% of Swift online submissions for Search Insert Position.
Memory Usage: 21.1 MB, less than 33.33% of Swift online submissions for Search Insert Position.
```
