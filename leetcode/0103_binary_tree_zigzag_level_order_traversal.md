# 103. Binary Tree Zigzag Level Order Traversal

- <https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/>
- BFS 的變形

## 20200316

### 1

``` swift
class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var result = [[Int]]()
        var queue = [root]
        var isLeft = true
        
        while !queue.isEmpty {
            let count = queue.count
            var subResult = [Int]()
            
            for _ in 0..<count {
                let current = queue.removeFirst()
                if isLeft {
                    subResult.append(current.val)
                } else {
                    subResult.insert(current.val, at: 0)
                }
                
                if let leftChild = current.left {
                    queue.append(leftChild)
                }
                
                if let rightChild = current.right {
                    queue.append(rightChild)
                }
            }
            
            isLeft = !isLeft
            result.append(subResult)
        }
        return result
    }
}
```

#### Result

``` text
Runtime: 12 ms, faster than 81.05% of Swift online submissions for Binary Tree Zigzag Level Order Traversal.
Memory Usage: 21 MB, less than 33.33% of Swift online submissions for Binary Tree Zigzag Level Order Traversal.
```
