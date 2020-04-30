# Check If a String Is a Valid Sequence from Root to Leaves Path in a Binary Tree

資料結構和演算法： `Hash Table` `Tree` `DFS`

- <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/532/week-5/3315/>

``` swift
class Solution {
    func isValidSequence(_ root: TreeNode?, _ arr: [Int]) -> Bool {
        var hashTable = [Int: Int]()
        var isValid = false
        
        // 紀錄數字出現的次數。
        for number in arr {
            hashTable[number] = (hashTable[number] ?? 0) + 1
        }
        
        // 開始進行 dfs 走訪
        subroutine(root, &hashTable, &isValid)
        
        return isValid
    }
    
    private func subroutine(_ node: TreeNode?, _ hashTable: inout [Int: Int], _ isValid: inout Bool) {
        // 若 node 為空值則中斷走訪。
        guard let node = node else { return }
        
        // hash table 空了還有 node 的話代表不合法。
        guard !hashTable.isEmpty else { return }
        
        // 如果在 hash table 沒有目前節點的計數的話，就中斷。
        guard var count = hashTable[node.val], count > 0 else { return }
        
        // 更新計數。歸零的話，設為 nil ，尚未為零就賦予新計數。
        let newCount = count - 1
        hashTable[node.val] = newCount == 0 ? nil : newCount
        
        // 如果 hash table 為空值，都沒有左右節點的話就為 true ，否則 false 。
        // 再來因為 hash table 已經淨空，也不需要再繼續走訪，所以直接中斷。
        if hashTable.isEmpty {
            hasValid = node.left == nil && node.right == nil
            return
        }
        
        // 檢查左節點。
        subroutine(node.left, &hashTable, &hasValid)
        // 如果走訪完左節點後已經有結果的話，就中斷走訪。
        if isValid { return }
        
        // 檢查右節點。
        subroutine(node.right, &hashTable, &hasValid)
        // 如果走訪完右節點後已經有結果的話，就中斷走訪。
        if isValid { return }
        
        // 還沒有找到結果，退出當前節點之前，把計數復原。
        hashTable[node.val] = count
    }
}
```

- <https://leetcode.com/submissions/detail/332298375/?from=/explore/challenge/card/30-day-leetcoding-challenge/532/week-5/3315/>
