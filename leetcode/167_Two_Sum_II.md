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

#### Result

```
Runtime: 40 ms, faster than 41.63% of Swift online submissions for Two Sum II - Input array is sorted.
Memory Usage: 21.3 MB, less than 25.00% of Swift online submissions for Two Sum II - Input array is sorted.
```

### 2

為了接近 O(n) 的時間複雜度，用頭尾的向中間的 flags 

這樣子也不需要再建立一個 dictionary 來存取和比較。

``` swift
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        if numbers.count < 2 { return [] }
        
        var low = 0
        var high = numbers.count - 1
        
        while low < high {
            let sum = numbers[low] + numbers[high]
            if sum > target {
                high -= 1
            } else if sum < target {
                low += 1
            } else {
                return [low + 1, high + 1]
            }
        }
        
        return []
    }
}
```

#### Result

```
Runtime: 32 ms, faster than 93.30% of Swift online submissions for Two Sum II - Input array is sorted.
Memory Usage: 21.4 MB, less than 25.00% of Swift online submissions for Two Sum II - Input array is sorted.
```
