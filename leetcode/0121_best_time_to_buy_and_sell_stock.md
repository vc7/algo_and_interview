# 121. Best Time to Buy and Sell Stock

`Array`

## 20200326

### 1 

暴力解雙迴圈，時間複雜度不漂亮

``` swift
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty { return 0 }
        
        var profit = 0
        
        for start in 0..<(prices.count-1) {
            for sell in start..<prices.count {
                profit = max(profit, prices[sell] - prices[start])
            }
        }
        
        return profit
    }
}
```

#### Result

``` text
Runtime: 3904 ms, faster than 5.06% of Swift online submissions for Best Time to Buy and Sell Stock.
Memory Usage: 21.5 MB, less than 16.67% of Swift online submissions for Best Time to Buy and Sell Stock.
```
