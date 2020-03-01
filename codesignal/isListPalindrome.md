# isListPalindrome

- <https://app.codesignal.com/interview-practice/task/HmNvEkfFShPhREMn4/description>

1. 利用 slow-fast pointer 來讓 slow 抵達 linked list 的中心點
2. 把 fast 設定回 head
3. 反轉 slow 以後的 linked list
4. 讓 fast 和 slow 重複依序跑，若是有不相同的值的話，就返回

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

func isListPalindrome(l: ListNode<Int>?) -> Bool {
    var slow = l
    var fast = l

    // 1. Use slow-fast pointer to move the slow one to the middle
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }

    // 2. Resets fast
    fast = l

    // 3. Reverse the sub linked list started from slow
    slow = reverse(slow)

    // 4. Checking
    while slow != nil {
        if slow?.value != fast?.value {
            return false
        }
        slow = slow?.next
        fast = fast?.next
    }

    return true
}

func reverse(_ original: ListNode<Int>?) -> ListNode<Int>? {
    var previous: ListNode<Int>?
    var node = original

    while node != nil {
        let temp = node?.next
        node?.next = previous
        previous = node
        node = temp
    }

    return previous
}
```

## 參考

- <https://youtube.com/watch?v=wk4QsvwQwdQ>
}
