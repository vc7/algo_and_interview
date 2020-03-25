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

### 2

One pass

``` swift
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0
        
        for price in prices {
            if price < minPrice {
                minPrice = price
            } else if (price - minPrice > maxProfit) {
                maxProfit = price - minPrice
            }
        }
        
        return maxProfit
    }
}
```

#### Result

``` text
Runtime: 40 ms, faster than 52.85% of Swift online submissions for Best Time to Buy and Sell Stock.
Memory Usage: 21.4 MB, less than 16.67% of Swift online submissions for Best Time to Buy and Sell Stock.
```

### 3

用高階函式

``` swift
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        
        return prices.reduce(0) {
            minPrice = min(minPrice, $1)
            return max($0, $1 - minPrice)
        }
    }
}
```

#### Result

``` text
Runtime: 40 ms, faster than 52.85% of Swift online submissions for Best Time to Buy and Sell Stock.
Memory Usage: 21.5 MB, less than 16.67% of Swift online submissions for Best Time to Buy and Sell Stock.
```

### 4

解法 2 的簡化

``` swift
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0
        
        for price in prices {
            minPrice = min(minPrice, price)
            maxProfit = max(maxProfit, price - minPrice)
        }
        
        return maxProfit
    }
}
```

#### Result

``` text
Runtime: 40 ms, faster than 52.85% of Swift online submissions for Best Time to Buy and Sell Stock.
Memory Usage: 21.2 MB, less than 16.67% of Swift online submissions for Best Time to Buy and Sell Stock.
```
