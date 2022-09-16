# 235. Lowest Common Ancestor of a Binary Search Tree

https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

### Iterative

```swift
class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else { return nil }
        
        var current: TreeNode? = root
        while let node = current {
            if node.val < p.val && node.val < q.val {
                current = node.right
            } else if node.val > p.val && node.val > q.val {
                current = node.left
            } else {
                return current
            }
        }
        
        return nil
    }
}
```

### Recursive

```swift
class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else { return nil }
        if root.val < p.val && root.val < q.val {
            return lowestCommonAncestor(root.right, p, q)
        } else if root.val > p.val && root.val > q.val {
            return lowestCommonAncestor(root.left, p, q)
        } else {
            return root
        }
    }
}
```
