# Stack

LIFO

### 主要的動作

push - 加元素到頂端
pop - 移除頂端第一個元素

## code

``` swift
class Stack<T> {
    private class Node {
        let value: T
        var next: Node?
        init(_ value: T) {
            self.value = value
        }
    }
    
    private var top: Node?
    
    func pop() -> T? {
        let value = top?.value
        top = top?.next
        return value
    }
    
    func push(_ value: T) {
        let node = Node(value)
        node.next = top
        top = node
    }
}
```

## 參考資料

- [Data Structures: Stacks and Queues](https://www.youtube.com/watch?v=wjI1WNcIntg)
