# 589. N-ary Tree Preorder Traversal

https://leetcode.com/problems/n-ary-tree-preorder-traversal/

## 20220913

```swift
class Solution {
    func preorder(_ root: Node?) -> [Int] {
    	var result = [Int]()
        travel(root, &result)
        return result
    }
    
    func travel(_ root: Node?, _ result: inout [Int]) {
        guard let root = root else { return }
        
        result.append(root.val)
        
        for child in root.children {
            travel(child, &result)
        }
    }
}
```
