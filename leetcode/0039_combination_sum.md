# 39. Combination Sum

## 20200219

### 1

``` swift
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var results = [[Int]]()
        if candidates.isEmpty { return results }
        var result = [Int]()
        
        findCombination(candidates, &results, &result, target, 0)
        
        return results
    }
    
    private func findCombination(_ candidates: [Int], _ results: inout [[Int]], _ result: inout [Int], _ remain: Int, _ startIndex: Int) {
        if remain < 0 {
            return
        } else if remain == 0 {
            results.append(result)
        } else {
            for index in startIndex..<candidates.count {
                let current = candidates[index]
                result.append(current)
                // Depth first 先走過一次所以可以直接傳參照進去
                // 如果每一次都重新建立 array 的話
                // 會消耗太多時間在初始化一個新的 array
                findCombination(candidates, &results, &result, remain - current, index)
                result.removeLast()
            }
        }
    }
}
```

#### Result

```
Runtime: 32 ms, faster than 82.16% of Swift online submissions for Combination Sum.
Memory Usage: 20.8 MB, less than 20.00% of Swift online submissions for Combination Sum.
```

#### Subroutine

- 用 backtracking 的方式解
- 取剩餘值，再從陣列的指定範圍中找解

條件：

- ① 加入結果： remain == 0
- ② 結束執行： remain < 0
- ③ 繼續找下一個： remain > 0 
