# Best Time to Buy and Sell Stock II

- <https://leetcode.com/explore/featured/card/30-day-leetcoding-challenge/528/week-1/3287/>

## Code

``` swift
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 1 { return 0 }
        var profit = 0
        for index in 1..<prices.count {
            if prices[index] > prices[index-1] {
                profit += prices[index] - prices[index-1]
            }
        }
        return profit
    }
}
```

### Result

- <https://leetcode.com/submissions/detail/320057750/>

``` text
Runtime: 36 ms (80.28)
Memory Usage: 21.3 MB
```
