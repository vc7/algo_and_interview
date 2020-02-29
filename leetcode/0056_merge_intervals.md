# 56. Merge Intervals

- <https://leetcode.com/problems/merge-intervals/>

## 20200229

### 1

``` swift
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.isEmpty { return [] }
        
        // 因為內容是無序的所以必須先排序之後才能處理
        let sorted = intervals.sorted { $0[0] < $1[0] }
        
        var result = [[Int]]()
        var current = sorted[0]
        
        for index in 1..<sorted.count  {
            let interval = sorted[index]
            
            if interval[0] <= current[1] {
                current[1] = max(current[1], interval[1])
            } else {
                result.append(current)
                current = interval
            }
        }
        result.append(current)
        
        return result
    }
}
```

#### Result

``` text
Runtime: 88 ms, faster than 92.61% of Swift online submissions for Merge Intervals.
Memory Usage: 21.4 MB, less than 16.67% of Swift online submissions for Merge Intervals.
```
