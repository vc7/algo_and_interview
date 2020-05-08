# 5 月 LeetCode 挑戰, W1D7, Cousins in Binary Tree (using Backtracking), in Swift

資料結構與演算法： `Hash Table` `DFS` `Backtracking` `Tree`

- 挑戰頁面 - [Cousins in Binary Tree](https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3322/)
- 原題目頁面 - [993. Cousins in Binary Tree](https://leetcode.com/problems/cousins-in-binary-tree/)

這篇是寫的時候想到的第一解，用 backtracking 的方式走訪每一個節點並記錄下每一個節點的資訊：深度與父節點。這題還可以用其他像是 `深度優先搜尋` 的方式解，程式碼比 backtracking 短。不過這篇就先記錄我自己原先的寫法，之後再另外寫深度優先搜尋的解法。

## 思考過程

- 由於是走訪的資料結構是樹，所以想到可以用深度走訪解題
- 老實的走過每一個節點，如果遇到 x 和 y 就把他們的資訊記錄下來，兩個都走到過的話就可以提前停止。
- 回傳題目給的條件之下的比較結果

### Backtracking 相關

- 想到要用 backtracking 或 dynamic programming(dp) 解的話，要先去了解「單一個節點」的行為。也可以說是 divide and conquer 的思考方式。
- 定好 `停止` 遞迴的條件，防止無限迴圈很重要！

## 程式碼

### 明確標示 hasX, hasY 等等

明確標示之下雖然變得有點長，不過對我自己來說語意上是好理解多了。
在行內有寫更詳細的說明，請參照：

``` swift
class Solution {
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        // 準備必要的變數
        var hashTable = [Int: (depth: Int, parent: Int)]()
        var hasX = false
        var hasY = false

        // 執行 backtracking
        find(root, &hashTable, 0, nil, x, y, &hasX, &hasY)

        // 根據題目給的條件回傳比較結果
        return hashTable[x]?.depth == hashTable[y]?.depth   // 條件 1 - 相同深度
            && hashTable[x]?.parent != hashTable[y]?.parent // 條件 2 - 不同父節點
    }

    /**
     Backtracking 用的子處理 (subroutine)

     - Parameters:
         - root: 想要走訪的節點
         - hashTable: 主要儲存的 hashTable
         - depth: 當前的深度
         - parent: 讓子節點參照的父節點
         - x: （提早停止用) 題目給的 x
         - y: （提早停止用) 題目給的 y
         - hasX: （提早停止用) 標示是否遇到 x 過
         - hasY: （提早停止用) 標示是否遇到 y 過
    */
    private func find(_ root: TreeNode?, _ hashTable: inout [Int: (depth: Int, parent: Int)], _ depth: Int, _ parent: TreeNode?, _ x: Int, _ y: Int, _ hasX: inout Bool, _ hasY: inout Bool) {
        // 停止：遇到空值就停止繼續走訪
        guard let root = root else { return }

        // 如果有遇到 x 或 y ，就紀錄節點資訊和調整對應的 flag
        // 題目有提到節點中的數值不會重複的限制，因此紀錄時可以不用考慮值會被覆蓋掉的情形。
        if root.val == x || root.val == y {
            hashTable[root.val] = (depth, parent?.val ?? -1)
            hasX = root.val == x
            hasY = root.val == y
        }

        // 停止：遇到 x 和 y 都有遇到過的話就停止繼續走訪
        if hasX && hasY { return }

        // 往下一層走的準備
        let newDepth = depth + 1
        // 走左節點
        find(root.left, &hashTable, newDepth, root, x, y, &hasX, &hasY)
        // 走右節點
        find(root.right, &hashTable, newDepth, root, x, y, &hasX, &hasY)
    }
}
```

### 簡化可以簡化的東西之後

``` swift
class Solution {
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        var hashTable = [Int: (depth: Int, parent: Int)]()
        find(root, &hashTable, 0, nil, x, y)

        return hashTable[x]?.depth == hashTable[y]?.depth   // 條件 1 - 相同深度
            && hashTable[x]?.parent != hashTable[y]?.parent // 條件 2 - 不同父節點
    }

    /// Subroutine of backtracking
    private func find(_ root: TreeNode?, _ hashTable: inout [Int: (depth: Int, parent: Int)], _ depth: Int, _ parent: TreeNode?, _ x: Int, _ y: Int) {
        guard let root = root else { return }

        if root.val == x || root.val == y {
            hashTable[root.val] = (depth, parent?.val ?? -1)
        }

        if hashTable[x] != nil && hashTable[y] != nil { return }

        find(root.left, &hashTable, depth + 1, root, x, y)
        find(root.right, &hashTable, depth + 1, root, x, y)
    }
}
```

## 複雜度分析

另 n 為這棵樹的總節點數。

- 時間複雜度： O(n)
  - 最壞的情形之下全部會個走過一次
- 空間複雜度： O(1)
  - 雖然有用了一個叫做 hashTable 的資料結構，但是只有裝 x 和 y 等資訊，因此算是 1

## 執行結果

``` text
Runtime: 8 ms (beats 96.49%)
Memory Usage: 20.9 MB
```

- <https://leetcode.com/submissions/detail/335765711/>
