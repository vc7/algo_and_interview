# 167. Two Sum II - Input array is sorted

## 20200207

### 1

初步想法是 [1. Two Sum](https://leetcode.com/problems/two-sum) 的延伸

``` swift
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        if numbers.count < 2 { return [] }
        
        var candidates = [Int: Int]()
        
        for (index, number) in numbers.enumerated() {
            let spare = target - number
            if let pare = candidates[spare] {
                if index > pare {
                    return [pare + 1, index + 1]
                } else {
                    return [index + 1, pare + 1]
                }
            }
            candidates[number] = index
        }
        
        return []
    }
}
```

Result

```
Runtime: 40 ms, faster than 41.63% of Swift online submissions for Two Sum II - Input array is sorted.
Memory Usage: 21.3 MB, less than 25.00% of Swift online submissions for Two Sum II - Input array is sorted.
```
