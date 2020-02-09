# 17. Letter Combinations of a Phone Number

- Backtracking

## 20200209

### 1

``` swift
class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        var results = [String]()
        if digits.count == 0 { return results }
        results.append("")
        
        let values = ["0", "1", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
        
        for (index, digit) in digits.enumerated() {
            if let position = Int(String(digit)) {
                let value = values[position]
                
                // 處理到直到結果陣列裡面最後一個元素的字元數不等於目前的 index
                // 例如 當處理第 2 (index 是 1) 個數字的時候，處理前的最後一個元素的字元素是 1 ，處理完成後的字元數要是 2
                while results[results.count - 1].count == index {
                    // 從尾巴移除要處理的目標
                    let item = results.removeLast()
                    // 走訪現在這個數值對應到的所有字元
                    for character in value {
                        // 把處理完的值插入到最前面
                        results.insert(item + String(character), at: 0)
                    }
                }
            }
        }
        
        return results
    }
}
```

#### Results

```
Runtime: 8 ms, faster than 69.02% of Swift online submissions for Letter Combinations of a Phone Number.
Memory Usage: 21.3 MB, less than 25.00% of Swift online submissions for Letter Combinations of a Phone Number.
```

#### Steps

例："23"

```
[c, b, a]
// 開始處理 index = 1, 第二個字 3
-> [af, ae, ad, c, b]
-> [bf, be, bd, af, ae, ad, c]
-> [cf, ce, cd, bf, be, bd, af, ae, ad]
陣列最後一個元素的字數已經大於 index ,  所以停止處理
```
