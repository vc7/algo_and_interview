# 11. Container With Most Water

## 20200209

### 1

Time Limit Exceeded

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
