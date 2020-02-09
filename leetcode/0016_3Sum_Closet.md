# 16. 3Sum Closest

## 20200209

### 1

``` swift
class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 { return 0 }
        
        let sortedNumbers = nums.sorted()
        var sum = sortedNumbers[0] + sortedNumbers[1] + sortedNumbers[sortedNumbers.count - 1]
        
        for index in 0..<(sortedNumbers.count-2) {
            var lower = index + 1
            var upper = sortedNumbers.count - 1

            while lower < upper {
                let currentSum = sortedNumbers[index] + sortedNumbers[lower] + sortedNumbers[upper]
                if currentSum > target {
                    upper -= 1
                } else {
                    lower += 1
                }

                if abs(currentSum - target) < abs(sum - target) {
                    sum = currentSum
                }
            }
        }
        
        return sum
    }
}
```

#### Result

```
Runtime: 120 ms, faster than 27.50% of Swift online submissions for 3Sum Closest.
Memory Usage: 20.4 MB, less than 100.00% of Swift online submissions for 3Sum Closest.
```
