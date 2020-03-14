# 78. Subsets

- <https://leetcode.com/problems/subsets/>

## 20200314

### 1

Backtracking

``` swift
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty { return [[]] }
        
        var combinations = [[Int]]()
        var combination = [Int]()
        
        for count in 0...nums.count {
            findCombination(&combinations, &combination, nums, 0, count)
        }
        
        return combinations
    }
    
    func findCombination(_ combinations: inout [[Int]], _ combination: inout [Int], _ nums: [Int], _ start: Int, _ count: Int) {
        if combination.count == count {
            combinations.append(combination)
            return 
        }
        
        if start >= nums.count {
            return
        }
        
        for index in start..<nums.count {
            combination.append(nums[index])
            findCombination(&combinations, &combination, nums, index + 1, count)
            combination.removeLast()
        }
    }
}
```

#### Result

``` text
Runtime: 8 ms, faster than 100.00% of Swift online submissions for Subsets.
Memory Usage: 21.1 MB, less than 20.00% of Swift online submissions for Subsets.
```
