# 628. Maximum Product of Three Numbers

`Array` `Math`

LINE 有出過的題目

-  [152](https://github.com/vc7/algo_and_interview/blob/master/leetcode/0152_maximum_product_subarray.md) 的延伸題

## 20200329

核心概念：關心的是 `最大三數` 和 `最小二數`

### 1

``` swift
class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        var largers = [Int.min, Int.min, Int.min]
        var smallers = [Int.max, Int.max]
        
        for num in nums {
            if num > largers[2] {
                largers[0] = largers[1]
                largers[1] = largers[2]
                largers[2] = num
            } else if num > largers[1] {
                largers[0] = largers[1]
                largers[1] = num
            } else if num > largers[0] {
                largers[0] = num
            }
            
            if num < smallers[0] {
                smallers[1] = smallers[0]
                smallers[0] = num
            } else if num < smallers[1] {
                smallers[1] = num
            }
        }
        
        return max(largers.reduce(1) { $0 * $1 },
                   smallers[0] * smallers[1] * largers[2])
    }
}
```

#### Result

``` text
Runtime: 280 ms, faster than 100.00% of Swift online submissions for Maximum Product of Three Numbers.
Memory Usage: 21.3 MB, less than 100.00% of Swift online submissions for Maximum Product of Three Numbers.
```
