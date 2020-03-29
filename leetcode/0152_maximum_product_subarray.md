# 152. Maximum Product Subarray

`Array` `Math`

- <https://leetcode.com/problems/maximum-product-subarray/>
- 進階題 - [628](https://github.com/vc7/algo_and_interview/blob/master/leetcode/0628_maximum_product_of_three_numbers.md)

參考

- <https://leetcode.com/problems/maximum-product-subarray/discuss/48335/Two-clean-different-solutions-C%2B%2B-well-commented>

## 20200326

### 1

``` swift
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var currentMax = 1
        var currentMin = 1
        var result = nums[0]
        
        for num in nums {
            let tempMax = currentMax * num
            let tempMin = currentMin * num
            
            result = max(result, tempMax, tempMin)
            
            currentMax = max(tempMin, tempMax, 1)
            currentMin = min(tempMin, tempMax)
        }
        return result
    }
}
```

#### Result

同樣的 code 效能差竟然差那麼多！

``` text
Runtime: 24 ms, faster than 63.24% of Swift online submissions for Maximum Product Subarray.
Memory Usage: 21.4 MB, less than 100.00% of Swift online submissions for Maximum Product Subarray.
```

``` text
Runtime: 20 ms, faster than 90.44% of Swift online submissions for Maximum Product Subarray.
Memory Usage: 21.1 MB, less than 100.00% of Swift online submissions for Maximum Product Subarray.
```

### 2

這個解法比 `1` 還要好理解

``` swift
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var currentMax = nums[0]
        var currentMin = nums[0]
        var result = nums[0]
        
        for num in nums[1...] {
            if num < 0 {
                let temp = currentMax
                currentMax = currentMin
                currentMin = temp
            }
            currentMax = max(currentMax * num, num)
            currentMin = min(currentMin * num, num)
            result = max(result, currentMax)
            
        }
        return result
    }
}
```

#### Result

``` text
Runtime: 20 ms, faster than 90.44% of Swift online submissions for Maximum Product Subarray.
Memory Usage: 21 MB, less than 100.00% of Swift online submissions for Maximum Product Subarray.
```
