# Single Number

- <https://leetcode.com/explore/other/card/30-day-leetcoding-challenge/528/week-1/3283/>
- <https://leetcode.com/problems/single-number/>

## code

``` swift
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0) { $0 ^ $1 }
    }
}
```

### Result

- <https://leetcode.com/submissions/detail/318344430/>

``` text
Runtime: 80 ms, faster than 87.35% of Swift online submissions for Single Number.
Memory Usage: 21 MB, less than 33.33% of Swift online submissions for Single Number.
```

## 改善

可以把預算過程簡化！

``` swift
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0, ^)
    }
}
```

### Result

- <https://leetcode.com/submissions/detail/318347074/>

``` text
Runtime: 76 ms
Memory Usage: 21.1 MB
```
