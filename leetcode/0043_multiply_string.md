# 43. Multiply Strings

- https://leetcode.com/problems/multiply-strings/discuss/17605/Easiest-JAVA-Solution-with-Graph-Explanation

## 20200218

### 1

``` swift
class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1.isEmpty || num2.isEmpty { return "" }
        if num1 == "0" || num2 == "0" { return "0" }
        var digits = Array(repeating: 0, count: num1.count + num2.count)
        
        let num1Characters = Array(num1).map(String.init)
        let num2Characters = Array(num2).map(String.init)
        
        // 用乘法直式去思考，從兩個數字的最低位數開始計算
        for index1 in (0..<num1Characters.count).reversed() {
            for index2 in (0..<num2Characters.count).reversed() {
                if let n1 = Int(num1Characters[index1]), let n2 = Int(num2Characters[index2]) {
                    let position = index1 + index2 + 1
                    let product = n1 * n2
                    // 加上上一位進位
                    let sum = product + digits[position]
                    
                    digits[position] = sum % 10
                    digits[position - 1] += sum / 10
                } else {
                    return ""
                }
            }
        }
        
        var result = ""
        
        for (index, digit) in digits.enumerated() {
            // 排除掉首位為零
            if index == 0 && digit == 0 {
                continue
            }
            
            result.append(String(digit))
        }
        
        return result
    }
}
```

#### Result

型別轉換很耗時間？

```
Runtime: 180 ms, faster than 33.33% of Swift online submissions for Multiply Strings.
Memory Usage: 21.3 MB, less than 100.00% of Swift online submissions for Multiply Strings.
```
