# mergeTwoLinkedLists

- <https://app.codesignal.com/interview-practice/task/6rE3maCQwrZS3Mm2H/description>

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
func mergeTwoLinkedLists(l1: ListNode<Int>?, l2: ListNode<Int>?) -> ListNode<Int>? {
    var one = l1
    var two = l2

    var dummy: ListNode<Int>? = ListNode<Int>(0)
    var head = dummy

    while one != nil && two != nil, let oneValue = one?.value, let twoValue = two?.value {
        if oneValue < twoValue {
            dummy?.next = one
            one = one?.next
        } else {
            dummy?.next = two
            two = two?.next
        }
        dummy = dummy?.next
    }
    
    if one != nil {
        dummy?.next = one
    }

    if two != nil {
        dummy?.next = two
    }

    return head?.next
}
```
