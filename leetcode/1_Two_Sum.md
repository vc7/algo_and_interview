# Two Sum

https://leetcode.com/problems/two-sum


## 20200207

### 1

這個解法太複雜了（笑

``` swift
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 1 else { return [] }
        
        var baseIndex = 0
        var movingIndex = baseIndex + 1
        
        while baseIndex < nums.count - 1 && movingIndex < nums.count {
            let spare = target - nums[baseIndex]
            let current = nums[movingIndex]
            
            if spare > current || spare < current {
                if movingIndex == nums.count - 1 {
                    baseIndex += 1
                    movingIndex = baseIndex + 1
                } else {
                    movingIndex += 1
                }
            } else {
                return [baseIndex, movingIndex]
            }
        }
        
        return []
    }
}
```

### Result

Runtime 2304ms, Memory 20.9 MB

```
Runtime: 2304 ms, faster than 5.09% of Swift online submissions for Two Sum.
Memory Usage: 20.9 MB, less than 5.88% of Swift online submissions for Two Sum.
```

## 2

``` swift
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count < 2 { return [] }
        var dictionary = [Int:Int]()
        
        for (index, num) in nums.enumerated() {
            if let found = dictionary[target - num] {
                return [found, index]
            }
            dictionary[num] = index
        }
        return []
    }
}
```

### Result

Runtime 32 ms, Memory 21.2 MB

``` 
Runtime: 32 ms, faster than 95.39% of Swift online submissions for Two Sum.
Memory Usage: 21.2 MB, less than 5.88% of Swift online submissions for Two Sum.
```

### 3

試著不要用 enumerate 但是差異沒有很大

``` swift
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count < 2 { return [] }
        var dictionary = [Int:Int]()
        
        for index in 0..<nums.count {
            let current = nums[index]
            if let found = dictionary[target-current] {
                return [found, index]
            }
            dictionary[current] = index
        }
        
        return []
    }
}
```

### Result

Runtime 32 ms, Memory 21 MB

```
Runtime: 32 ms, faster than 95.39% of Swift online submissions for Two Sum.
Memory Usage: 21 MB, less than 5.88% of Swift online submissions for Two Sum.
```
