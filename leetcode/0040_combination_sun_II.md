# 40. Combination Sum II

## 20200218

### 1

解題思維和 39. 一樣

``` swift
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var results = [[Int]]()
        if candidates.isEmpty { return results }
        let sortedCandidates = candidates.sorted()
        var result = [Int]()
        
        findCombinations(sortedCandidates, &results, &result, target, 0)
        
        return results
    }
    
    private func findCombinations(_ candidates: [Int], _ results: inout [[Int]], _ result: inout [Int], _ remain: Int, _ start: Int) {
        if remain < 0 {
            return 
        } else if remain == 0 {
            // 把 result 加入 results
            results.append(result)
        } else {
            for index in start..<candidates.count {
                if index > start && candidates[index] == candidates[index - 1] {
                    // 已經和前一個數字重複了，因為前一個數字在處理的時候已經檢查過了，因此在這邊不用檢查直接跳過
                    continue
                }
                
                let current = candidates[index]
                let newRemain = remain - current
                
                result.append(current)
                findCombinations(candidates, &results, &result, newRemain, index + 1)
                result.removeLast()
            }
        }
    }
}
```

#### Result

```
Runtime: 20 ms, faster than 100.00% of Swift online submissions for Combination Sum II.
Memory Usage: 21.1 MB, less than 33.33% of Swift online submissions for Combination Sum II.
```
