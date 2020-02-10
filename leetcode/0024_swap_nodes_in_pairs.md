# 24. Swap Nodes in Pairs

## 20200210

### 1

Timeout ...

``` swift
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        var dummyNode: ListNode? = ListNode(0)
        dummyNode?.next = head?.next
        var currentNode: ListNode? = head
        var tempNode: ListNode?
        var isOdd: Bool = false
        
        while currentNode?.next != nil {
            if isOdd {
                tempNode = currentNode?.next?.next
                currentNode?.next?.next = currentNode
                currentNode?.next = tempNode
                
                currentNode = tempNode
                isOdd = true
            } else {
                isOdd = false
            }
        }
        
        return dummyNode?.next
    }
}
```
