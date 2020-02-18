# 46. Permutations

## 20200218

### 1

- 排列組合列出所有可能性可以用列舉
- 用 used 作為使用過的 mask

``` swift
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty { return [[Int]]() }
        
        var results: [[Int]]  = []
        var used = [Int: Bool]()
        var result = [Int]()
        
        generateCombinations(&results, nums, &result, &used)
        
        return results
    }
    
    private func generateCombinations(_ results: inout [[Int]], _ nums: [Int] , _ result: inout [Int], _ used: inout [Int: Bool]) {
        if result.count == nums.count {
            results.append(result)
            return
        }
        
        for num in nums {
            if used[num] == nil {
                result.append(num)
                used[num] = true
                
                // Go deeper
                generateCombinations(&results, nums, &result, &used)
                
                // 重置
                result.removeLast()
                used[num] = nil
            }
        }
    }
}
```

#### Result

```
Runtime: 24 ms, faster than 70.45% of Swift online submissions for Permutations.
Memory Usage: 20.7 MB, less than 16.67% of Swift online submissions for Permutations.
```
