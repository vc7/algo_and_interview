# 55. Jump Game

- 參考: https://leetcode.com/problems/jump-game/submissions/

## 20200223

### 1

``` swift
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var lastPosition = nums.count - 1
        for index in (0..<nums.count).reversed() {
            if index + nums[index] >= lastPosition {
                // 可以超過 lastPosition 代表目前的 index 可以和 lastPosition 連結起來
                // 因此就可以將 lastPosition 更新成當前的位置
                lastPosition = index
            }
            // 否則，不做任何事，繼續走訪檢查下一個數
        }     
        return lastPosition == 0
    }
}
```

#### Result

```
Runtime: 72 ms, faster than 62.50% of Swift online submissions for Jump Game.
Memory Usage: 21.1 MB, less than 100.00% of Swift online submissions for Jump Game.
```
