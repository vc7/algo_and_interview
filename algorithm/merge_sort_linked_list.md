# 合併排序 - Linked List

## Code

（Node 的實作在下一小節）

1. 利用 slow-fast pointers 找出 linked list 的中間點
2. 從中間點切斷成兩個子 linked list
3. 遞迴切到最小元素（當節點的 next 為 nil 的時候，即是最小元素）
4. 排序並兩個子 linked list

``` swift
func sort(_ source: Node<Int>?) -> Node<Int>? {
    if source == nil || source?.next == nil { return source }
    
    // 標記切斷的位置
    var leftTail = source
    // 標記右側 linked list 的起始
    var slow = source
    // 用來偵測 slow 是否已經走到中間點的輔助 fast pointer
    var fast = source
    
    while fast != nil && fast?.next != nil {
        leftTail = slow
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    // 切斷
    leftTail?.next = nil
    
    // 繼續切
    let left = sort(source)
    let right = sort(slow)
    
    // 排序並合併
    return sortAndMerge(left, right)
}

func sortAndMerge(_ left: Node<Int>?, _ right: Node<Int>?) -> Node<Int>? {
    let dummy = Node(0)
    var head: Node<Int>? = dummy
    
    var localLeft = left
    var localRight = right
    
    while localLeft != nil && localRight != nil, let rightValue = localRight?.value, let leftValue = localLeft?.value {
        if rightValue > leftValue {
            head?.next = localLeft
            localLeft = localLeft?.next
        } else {
            head?.next = localRight
            localRight = localRight?.next
        }
        head = head?.next
    }
    
    if localLeft != nil {
        head?.next = localLeft
    }
    
    if localRight != nil {
        head?.next = localRight
    }
    
    return dummy.next
}
```

### Node

``` swift
class Node<T: Equatable & CustomStringConvertible>: CustomStringConvertible {
    let value: T
    var next: Node<T>?
    
    init(_ value: T) {
        self.value = value
    }
    
    var description: String {
        var node: Node<T>? = self.next
        var string = "\(self.value)"
        while node != nil {
            string.append(" -> \(node!.value)")
            node = node?.next
        }
        return string
    }
}
```

## 執行

生成 Linked List：

``` swift
let one = Node(1)
let two = Node(2)
let three = Node(3)
let four = Node(4)

four.next = three
three.next = two
two.next = one
```

這個 Linked List 長這樣：

``` text
4 -> 3 -> 2 -> 1
```

進行排序：

``` swift
let sorted = sort(four)
```

排序後的結果如下：

``` text
1 -> 2 -> 3 -> 4
```
