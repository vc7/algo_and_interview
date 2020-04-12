# Diameter of Binary Tree

資料結構和演算法： `Backtracking` `Tree`

- <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3293/>
- [543. Diameter of Binary Tree](https://leetcode.com/problems/diameter-of-binary-tree/)

題目要問的是樹之中某兩個節點之間最長的距離。

## 思維

看到要找樹的高，因為要 go deep 所以就可以先想到 DFS (深度優先搜尋) 和 backtracking 。

### Backtracking

而對於 backtracking 的 subroutine ，我們必須定義結束遞迴呼叫的條件。

### 停止條件

- 當傳入的 root 為零，就回傳 0 不繼續執行

### 走訪方式

- 用遞迴走訪左右節點，取得各自的樹高

因此可以拿左右的樹高做兩件事情

1. 算出這個節點出發的直徑和目前做大直徑比較，有大於的話則更新最大直徑。
2. 因為我們只關心最大的樹高，因此找出最大樹高並回傳

### 最大直徑

因為不能確定在樹的哪邊會拿到最大值，因此會需要在遞迴的過程之外有個變數來儲存這個值。並在走訪過程中不斷的檢查和更新她。

## 程式碼

``` swift
class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var result = 0
        height(root, &result)
        return result
    }

    @discardableResult
    func height(_ root: TreeNode?,_ result: inout Int) -> Int {
        if root == nil { return 0 }

        let left = height(root?.left, &result)
        let right = height(root?.right, &result)

        result = max(result, left + right)
        return max(left, right) + 1
    }
}
```

### 複雜度分析

令 n 為節點數

- 時間複雜度： O(n) 。因為我們必須走過每個節點知道所有的可能性
- 空間複雜度： O(n) 。每一個 subroutine 都會宣告 left 和 right 來暫存，所以實際上是 2n ，不過我們可以把它簡化成 n

### 結果

- <https://leetcode.com/submissions/detail/323131137>

``` text
Runtime: 28 ms (93.83%)
Memory Usage: 21.7 MB
```

## 困惑的地方 - 名稱

以樹的定義來看的話，題目中說的「深度」應該要叫「高」。不過我沒有這麼魔人，只是在命名方法的時候是有點想了一下到底該用哪個名稱好 XDDD
