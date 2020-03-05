# 122. Best Time to Buy and Sell Stock II

- <https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/>

## 20200305

### 1

``` swift
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count <= 1 { return 0 }
        var maximum = 0
        
        for index in 1..<prices.count {
            if prices[index] > prices[index - 1] {
                maximum += prices[index] - prices[index - 1]
            }
        }
        return maximum
    }
}
```

#### Result

``` text
Runtime: 32 ms, faster than 96.65% of Swift online submissions for Best Time to Buy and Sell Stock II.
Memory Usage: 21.1 MB, less than 100.00% of Swift online submissions for Best Time to Buy and Sell Stock II.
```
