# 90. Subsets II

- <https://leetcode.com/problems/subsets-ii/>
- Related to
  - [78. Subsets](https://leetcode.com/problems/subsets/), [note](https://github.com/vc7/algo_and_interview/blob/master/leetcode/0078_subsets.md)

`Array` `Backtracking`

## 20200320

### 1

要事先排序的原因是，如果像是 `[1, 2, 3, 2, 3]` 這樣重複方式會很難處理

``` swift
class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty { return [[]] }
        var sorted = nums.sorted()
        var results = [[Int]]()
        var result = [Int]()
        
        subroutine(sorted, &results, &result, 0)
        
        return results
    }
    
    func subroutine(_ nums: [Int], _ results: inout [[Int]], _ result: inout [Int], _ start: Int) {
        results.append(result)
        
        for index in start..<nums.count {
            // 省略條件
            // 如果和前一項相同值的話就不繼續執行
            if index > start && nums[index] == nums[index - 1] {
                continue
            }
            
            result.append(nums[index])
            subroutine(nums, &results, &result, index + 1)
            result.removeLast()
        }
    }
}
```

#### Result

``` text
Runtime: 8 ms, faster than 100.00% of Swift online submissions for Subsets II.
Memory Usage: 21.3 MB, less than 33.33% of Swift online submissions for Subsets II.
```
