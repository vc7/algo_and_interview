# 70. Climbing Stairs

- <https://leetcode.com/problems/climbing-stairs/>
- DP + Memoization.

## 20200312

### 1

``` swift
class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 0 || n == 1 { return 1 }
        var memo = [0: 1, 1: 1]
        return subSteps(n: n, memo: &memo)
    }
    
    func subSteps(n: Int, memo: inout [Int: Int]) -> Int {
        if let result = memo[n] { return result }
        let result = subSteps(n: n - 1, memo: &memo) + subSteps(n: n - 2, memo: &memo)
        memo[n] = result
        
        return result
    }
}
```

#### Result

``` text
Runtime: 4 ms, faster than 84.82% of Swift online submissions for Climbing Stairs.
Memory Usage: 20.8 MB, less than 20.00% of Swift online submissions for Climbing Stairs.
```
