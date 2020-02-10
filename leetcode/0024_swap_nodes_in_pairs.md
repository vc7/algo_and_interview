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

### 2

原先概念沒錯，問題在還不熟悉 link list 的操作 ...

``` swift
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        var dummy: ListNode? = ListNode(0)
        dummy?.next = head
        
        // current 用來放兩個兩個第一組的前一個元素，用來當參照值
        var current: ListNode? = dummy
        
        while current?.next != nil && current?.next?.next != nil {
            
            // 把需要對調的兩個 nodes 暫存到變數裡
            let first = current?.next
            let second = current?.next?.next
            
            // Swapping
            first?.next = second?.next
            current?.next = second
            second?.next = first
            
            // 更新 current 的位置，下一組的前一項就是指 first
            current = first
        }
        
        return dummy?.next
    }
}
```

#### Result

```
Runtime: 8 ms, faster than 74.86% of Swift online submissions for Swap Nodes in Pairs.
Memory Usage: 20.7 MB, less than 100.00% of Swift online submissions for Swap Nodes in Pairs.
```
