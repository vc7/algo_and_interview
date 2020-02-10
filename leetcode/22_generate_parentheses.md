# 22. Generate Parentheses

## 20200210

### 1

``` swift
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        backtrack("", 0, 0, n) { result.append($0) }
        return result
    }

    func backtrack(_ current: String,_ open: Int,_ end: Int,_ max: Int, _ result: (String)->Void) {
        // 回朔法基本上都會需要一個 base case
        // 在這邊放入完結這個 recursion 的條件
        if current.count == max * 2 {
            result(current)
            return
        }
        
        // Backtracking always involving decisions
        // 這邊就是放除了 base case 以外的條件
        if open < max { backtrack(current + "(", open + 1, end, max, result) }
        if end < open  { backtrack(current + ")", open, end + 1, max, result) }
    }
}
```

#### Result

```
Runtime: 12 ms, faster than 99.03% of Swift online submissions for Generate Parentheses.
Memory Usage: 20.6 MB, less than 33.33% of Swift online submissions for Generate Parentheses.
```
