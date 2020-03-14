# 69. Sqrt(x)

- <https://leetcode.com/problems/sqrtx/>

## 20200314

### 1

Binary search

``` swift
class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 1 { return 1 }
        var lowerBound = 0
        var upperBound = x
        
        while lowerBound <= upperBound {
            let middle = lowerBound + (upperBound - lowerBound) / 2
            let middleSquared = middle * middle
            
            if middleSquared == x {
                return middle
            } else if middleSquared < x {
                lowerBound = middle + 1
            } else {
                upperBound = middle - 1
            }
        }
        
        return lowerBound - 1
    }
}
```

#### Result

``` text
Runtime: 8 ms, faster than 84.17% of Swift online submissions for Sqrt(x).
Memory Usage: 20.7 MB, less than 100.00% of Swift online submissions for Sqrt(x).
```
