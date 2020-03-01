# removeKFromList

- <https://app.codesignal.com/interview-practice/task/gX7NXPBrYThXZuanm/description>

## 20200301

### 1

``` swift
// Singly-linked lists are already defined with this interface:
// public class ListNode<T> {
//     public var value: T
//     public var next: ListNode<T>?
//     public init(_ x: T) {
//         self.value = x
//         self.next = nil
//     }
// }
//

func removeKFromList(l: ListNode<Int>?, k: Int) -> ListNode<Int>? {
    let dummy: ListNode<Int>? = ListNode(0)
    dummy?.next = l
    var previous = dummy
    var node = dummy?.next

    while node != nil {
        if node?.value == k {
            previous?.next = node?.next
            node = previous?.next
        } else {
            previous = node
            node = node?.next
        }
    }

    return dummy?.next
}
```
