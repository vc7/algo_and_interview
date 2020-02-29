# Queue

FIFO

## 主要的動作

- add - 加元素到尾端
- remove - 移除第一個元素

## Code

``` swift
class Queue<T> {
    class Node {
        let value: T
        var next: Node?
        init(_ value: T) {
            self.value = value
        }
    }
    
    var head: Node?
    var tail: Node?
    
    func add(_ value: T) {
        let node = Node(value)
        
        // Add to the tail's next
        if tail != nil {
            tail?.next = node
        }
        
        // Update the tail
        tail = node

        // If there isn't any head
        if head == nil {
            head = node
        }
    }
    
    func remove() -> T? {
        let value = head?.value
        
        head = head?.next
        if head == nil {
            tail = nil
        }
        return value
    }
}
```

## 參考資料

- [Data Structures: Stacks and Queues](https://www.youtube.com/watch?v=wjI1WNcIntg)
