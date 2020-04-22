# Construct Binary Search Tree from Preorder Traversal

## 解 1

- <https://leetcode.com/submissions/detail/327687963/?from=/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3305/>
- <https://leetcode.com/submissions/detail/327688522/?from=/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3305/>


``` swift
class Solution {
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        var current = 0
        return createSubtree(preorder, &current, Int.min, Int.max)
    }
    
    func createSubtree(_ items: [Int], 
                       _ current: inout Int,
                       _ bottom: Int,
                       _ top: Int) -> TreeNode? {
        if current >= items.count { 
            return nil
        }
        
        var node: TreeNode?
        let value = items[current]
        
        if value > bottom && value < top {
            node = TreeNode(value)
            current += 1
            
            if current < items.count {
                node?.left  = createSubtree(items, &current, bottom, value)
                node?.right = createSubtree(items, &current,  value,   top)
            }
        }
        
        return node
    }
}
```

## 解 2

- <https://leetcode.com/submissions/detail/327694109/?from=/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3305/>
- <https://leetcode.com/submissions/detail/327695706/?from=/explore/challenge/card/30-day-leetcoding-challenge/530/week-3/3305/>

``` swift
class Solution {
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        if preorder.isEmpty { return nil }
        
        var node = TreeNode(preorder[0])
        
        for index in 1..<preorder.count {
            insert(to: node, preorder[index])
        }
        
        return node
    }
    
    func insert(to node: TreeNode, _ value: Int) {
        if value <= node.val {
            if let left = node.left {
                insert(to: left, value)
            } else {
                node.left = TreeNode(value)
            }
        } else {
            if let right = node.right {
                insert(to: right, value)
            } else {
                node.right = TreeNode(value)
            }
        }
    }
}
```

調整（好像也沒有比較快）

``` swift
class Solution {
    
    private var index: Int = 0
    private var items: [Int]!
    
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        items = preorder
        return createSubtree(Int.min, Int.max)
    }
    
    func createSubtree(_ bottom: Int,
                       _ top: Int) -> TreeNode? {
        if index >= items.count { 
            return nil
        }
        
        let value = items[index]
        
        if value < bottom || value > top { return nil }
        
        let node = TreeNode(value)
        index += 1

        if index < items.count {
            node.left  = createSubtree(bottom, value)
            node.right = createSubtree( value,   top)
        }

        return node
    }
}
```