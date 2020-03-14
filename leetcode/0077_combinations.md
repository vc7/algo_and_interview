# 77. Combinations

- <https://leetcode.com/problems/combinations/>
- Backtracking

## 20200314

### 1

``` swift
class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var combinations = [[Int]]()
        var combination = [Int]()
        
        findCombinations(&combinations, &combination, n, 1, k)
        
        return combinations
    }
    
    func findCombinations(_ combinations: inout [[Int]], _ combination: inout [Int], _ n: Int, _ start: Int, _ k: Int) {
        if k == 0 {
            combinations.append(combination)
            return
        }
        
        if start > n {
            return
        }
        
        for index in start...n {
            combination.append(index)
            findCombinations(&combinations, &combination, n, index + 1, k - 1)
            combination.removeLast()
        }
    }
}
```

#### Result

``` text
Runtime: 196 ms, faster than 83.12% of Swift online submissions for Combinations.
Memory Usage: 22.4 MB, less than 100.00% of Swift online submissions for Combinations.
```
