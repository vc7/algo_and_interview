# 166. Fraction to Recurring Decimal

`Math` `HashMap`

* 每日一題： https://leetcode.com/problems/fraction-to-recurring-decimal/description/?envType=daily-question&envId=2025-09-19
* vocus： https://vocus.cc/article/68d404affd89780001bfee93

## 程式碼

```swift
class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        guard numerator != 0 else { return "0" }

        // 暫存結果
        var result = [String]()

        // 分子與分母正負值不一樣的時候，暫存負號
        if (numerator > 0 && denominator < 0) || (numerator < 0 && denominator > 0) {
            result.append("-")
        }

        // 取絕對值。分子會持續改變，分母固定，因此 var 和 let 如此設定
        var numerator = abs(numerator)
        let denominator = abs(denominator)

        // 先算整數的部分。計算完之後更新分子，新的分子為零時，代表計算結束回傳結果。
        result.append(String(numerator/denominator))
        numerator = numerator % denominator
        
        guard numerator != 0 else { return result.joined() }

        // 在計算小數位
        result.append(".")

        // 為了要知道重複的小數位，建立一個 dictionary (HashMap) 來紀錄重複開始的位置。
        var map = [Int: Int]()
        map[numerator] = result.count

        // 正向 routine - 執行到分子為零就停止
        while numerator != 0 {
            // 小數點以下每一次計算分子（被除數）都要補 0
            numerator *= 10

            // 進行除法運算、更新分子
            result.append(String(numerator/denominator))
            numerator = numerator % denominator

            if let value = map[numerator] {
                // 發現有重複的數字就停止
                let index = value
                result.insert("(", at: index)
                result.append(")")
                break
            } else {
                map[numerator] = result.count
            }
        }
        
        return result.joined()
    }
}
```
