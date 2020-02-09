# 21. Merge Two Sorted Lists

## 20200209

### 1

``` swift
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummyNode: ListNode? = ListNode(0)
        var previousNode: ListNode? = dummyNode
        
        var list1: ListNode? = l1
        var list2: ListNode? = l2
        
        while list1 != nil && list2 != nil {
            if list1!.val < list2!.val {
                previousNode?.next = list1
                list1 = list1?.next
            } else {
                previousNode?.next = list2
                list2 = list2?.next
            }
            
            previousNode = previousNode?.next
        }
        
        if list1 != nil {
            previousNode?.next = list1
        }
        if list2 != nil {
            previousNode?.next = list2
        }
        
        return dummyNode?.next
    }
}
```

#### Result

```
Runtime: 12 ms, faster than 97.75% of Swift online submissions for Merge Two Sorted Lists.
Memory Usage: 20.8 MB, less than 25.00% of Swift online submissions for Merge Two Sorted Lists.
```
