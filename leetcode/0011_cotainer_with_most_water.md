# 11. Container With Most Water

## 20200209

### 1

- Time Limit Exceeded
- 暴力解法

``` swift
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maximum = 0
        
        for outerIndex in 0..<height.count - 1 {
            let number = height[outerIndex]
            for innerIndex in (outerIndex + 1)..<height.count {
                let larger = min(number, height[innerIndex])
                let distance = innerIndex - outerIndex
                maximum = max(maximum, larger * distance)
            }
        }
        
        return maximum
    }
}
```

#### Result

超時 ...
複雜度是 O(n^2)

### 2

~雙主菜~ 雙 Pointer 從最左邊和最右邊逐一往中間收

```
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maximum = 0
        var lowerPointer = 0
        var upperPointer = height.count - 1
        
        while lowerPointer < upperPointer {
            maximum = max(maximum, min(height[lowerPointer], height[upperPointer]) * (upperPointer - lowerPointer))
            
            // 因為要確保比較大的容量，所以要移動比較短的那一側的 pointer
            if height[lowerPointer] < height[upperPointer] {
                lowerPointer += 1
            } else {
                upperPointer -= 1
            }
        }
        
        return maximum
    }
}
```

#### Result

時間複雜度是 O(n)

```
Runtime: 104 ms, faster than 89.55% of Swift online submissions for Container With Most Water.
Memory Usage: 21.2 MB, less than 20.00% of Swift online submissions for Container With Most Water.
```
