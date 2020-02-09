# 19. Remove Nth Node From End of List

## 20200209

### 1

``` swift
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n == 0 || head == nil { return head }
        var node = head
        var previous: ListNode?
        
        while node != nil {
            var current: ListNode?
            for index in 0..<n {
                current = (current == nil) ? node?.next : current?.next
                if index != n - 1 && current == nil {
                    return head
                }
            }
            
            if current == nil {
                if previous == nil {
                    return node?.next
                } else {
                    previous?.next = node?.next
                    return head
                }
            }
            
            previous = node
            node = node?.next
        }
        
        return head
    }
}
```

#### Result

```
Runtime: 12 ms, faster than 54.35% of Swift online submissions for Remove Nth Node From End of List.
Memory Usage: 20.6 MB, less than 50.00% of Swift online submissions for Remove Nth Node From End of List.
```
