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

## 20200320

### 1

原先的寫法裡面多用了一個參數來計算還有幾個元素需要加上去，但是邊 backtracking 就可以一邊儲存起來，結束條件則改為 start == nums.count ，走訪到最後一位的時候就會自己停下來了。

``` swift
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty { return [[]] }
        
        var combinations = [[Int]]()
        var combination = [Int]()
        
        findCombination(&combinations, &combination, nums, 0)
        
        return combinations
    }
    
    func findCombination(_ combinations: inout [[Int]], _ combination: inout [Int], _ nums: [Int], _ start: Int) {
        // 邊 backtracking 就可以邊儲存起來，因此不用去計算還剩下幾個元素需要加上去
        combinations.append(combination)
        
        // start 等於 nums.count 的時候自動會停止不會繼續執行
        for index in start..<nums.count {
            combination.append(nums[index])
            findCombination(&combinations, &combination, nums, index + 1)
            combination.removeLast()
        }
    }
}
```

#### Result

``` text
Runtime: 4 ms, faster than 100.00% of Swift online submissions for Subsets.
Memory Usage: 21.1 MB, less than 20.00% of Swift online submissions for Subsets.
```
