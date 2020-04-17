# Valid Parenthesis String

資料結構及演算法： `Greedy`

- 題目頁面 - <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3301/>
- 原題目頁面 - [678. Valid Parenthesis String](https://leetcode.com/problems/valid-parenthesis-string/)

有些部分還不太能夠用自己的話講出來，待理解之後再補。

## 解題方式

因為沒有要判斷到底是誰或是哪個位置的符號會多出來，因此可以不用實際用 stack 去操作和判斷，直接去找規則然後做解法。

1. 先不考慮星號時的解法
2. 把星號考慮進去

### 先不考慮星號

基本概念是：令左括號 `(` 為 +1 ， `)` 為 -1 。只要走訪過整個字串後總和為 0 的話就能說這個字串裡面的括號是合法的。

去算總和值而不是操作資料本身這個概念在這幾天的題目有出現幾次。

``` swift
var sum = 0

for character in s {
    if character == "(" {
        sum += 1
    } else if character = ")" {
        sum -= 1
    }
}

return sum == 0 // 正值代表有多出來的左括號，負值代表有多出來的右括號
```

### 把星號考慮進去

根據題目， `星號` 可以代表 `)` 和 `空字串` 以及 `(` ，因此它可以讓總和有 -1, 0, +1 三種變化。

而總和也從 `單一個值` ，變成了 `一個範圍` 。

歸納之後如下：

| 符號 | 範圍頭 | 範圍尾 |
|:---:|:---:|:---:|
| ( | +1 | +1 |
| ) | -1 | -1 |
| * | -1 | +1 |

## 程式碼

``` swift
class Solution {
    func checkValidString(_ s: String) -> Bool {
        // 總和的可能範圍
        var lowerEnd = 0
        var upperEnd = 0
        
        for character in s {
            switch character {
                case "(":
                    lowerEnd += 1
                    upperEnd += 1
                case ")":
                    lowerEnd -= 1
                    upperEnd -= 1
                case "*":
                    lowerEnd -= 1
                    upperEnd += 1
                default:
                    break
            }
            
            // 代表有多餘的右括號，因為已經無法救回所以直接回傳結果
            if upperEnd < 0 { return false }

            // 切掉負值，這一行還不太知道該怎麼解釋。
            lowerEnd = max(lowerEnd, 0)
        }
        
        return lowerEnd <= 0 && upperEnd >= 0
    }
}
```

## 複雜度分析

令 n 為字串長度。

- 時間複雜度： O(n) 線性時間
- 空間複雜度： O(1) 常數空間

## 執行結果

``` text
Runtime: 4 ms (beats 94.44%)
Memory Usage: 20.9 MB
```

https://leetcode.com/submissions/detail/325710197/?from=/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3301/