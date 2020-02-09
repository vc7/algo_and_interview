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

### 2

- 用慢快指標來操作，就不用一一判斷了
- https://www.youtube.com/watch?v=XtYEEvrhemI

``` swift
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummyHead:ListNode? = ListNode(0)
        dummyHead?.next = head
        
        var fastNode:ListNode? = dummyHead
        var slowNode:ListNode? = dummyHead
        
        
        for _ in 0...n {
            fastNode = fastNode?.next
        }
        
        while fastNode != nil {
            slowNode = slowNode?.next
            fastNode = fastNode?.next
        }
        
        slowNode?.next = slowNode?.next?.next
        return dummyHead?.next
    }
}
```

```
n = 1

先把輔助用的 fastPointer 放定位
             * fastPointer
+---+---+  +---+---+  +---+---+
| 0 | *-+->| 1 | *-+->| 2 | * |
+---+---+  +---+---+  +---+---+

接著一起移動
                        
  * slowPointer         * fastPointer
+---+---+  +---+---+  +---+---+
| 0 | *-+->| 1 | *-+->| 2 | * |
+---+---+  +---+---+  +---+---+


             * slowPointer         * fastPointer (變成 nil)
+---+---+  +---+---+  +---+---+
| 0 | *-+->| 1 | *-+->| 2 | * |
+---+---+  +---+---+  +---+---+

這時候就會得到需要移除值是 1 的節點

+---+---+  +---+---+
| 0 | *-+->| 2 | * |
+---+---+  +---+---+
```

#### Result

```
Runtime: 8 ms, faster than 88.59% of Swift online submissions for Remove Nth Node From End of List.
Memory Usage: 20.6 MB, less than 50.00% of Swift online submissions for Remove Nth Node From End of List.
```
