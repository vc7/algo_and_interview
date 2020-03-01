# addTwoHugeNumbers

- <https://app.codesignal.com/interview-practice/task/RvDFbsNC3Xn7pnQfH/description>

1. 反轉兩個 Linked List
2. 逐一加總，並紀錄進位的數字，直到其中一個 linked list 走訪玩
3. 各自檢查還有沒有剩的
4. 檢查有沒有最後進位的數字並加入

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
func addTwoHugeNumbers(a: ListNode<Int>?, b: ListNode<Int>?) -> ListNode<Int>? {
    var reversedA = reverse(a)
    var reversedB = reverse(b)
    var dummy: ListNode<Int>? = ListNode(0)
    let head = dummy
    var next = 0

    while reversedA != nil && reversedB != nil {
        let value = reversedA!.value + reversedB!.value + next
        let remainder = value % 10000
        next = value / 10000

        let node = ListNode(remainder)
        node.next = head?.next
        head?.next = node

        reversedA = reversedA?.next
        reversedB = reversedB?.next
    }

    // Handling A
    while reversedA != nil {
        let value = reversedA!.value + next
        let remainder = value % 10000
        next = value / 10000

        let node = ListNode(remainder)
        node.next = head?.next
        head?.next = node
        
        reversedA = reversedA?.next
    }

    // Handling B
    while reversedB != nil {
        let value = reversedB!.value + next
        let remainder = value % 10000
        next = value / 10000

        let node = ListNode(remainder)
        node.next = head?.next
        head?.next = node

        reversedB = reversedB?.next
    }

    // Handling

    if next > 0 {
        let node = ListNode(next)
        node.next = head?.next
        head?.next = node
    }

    return head?.next
}

func reverse<T>(_ original: ListNode<T>?) -> ListNode<T>? {
    var previouse: ListNode<T>?
    var node = original

    while node != nil {
        let temp = node?.next
        node?.next = previouse
        previouse = node
        node = temp
    }
    return previouse
}
```
