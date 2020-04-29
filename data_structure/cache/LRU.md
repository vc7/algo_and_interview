# LRU (Least Recently Used)

- wiki - <https://en.wikipedia.org/wiki/Cache_replacement_policies#Least_recently_used_(LRU)>
- <https://www.youtube.com/watch?v=S6IfqDXWa10>

概要：有固定的儲存空間。當取用或修改的時候，該資料結構會到快取隊列的最前方。新增值的時候，會新增在最前方，當儲存的數量超過的時候，就會移除最舊的資料。

在初始化的時候會指定快取的空間，主要有 get 和 put 兩個方法。資料結構使用雙向鏈結和一個 hash table 方便快速存取鍵值所對應的節點。

``` swift
// https://leetcode.com/submissions/detail/331813212/
class LRUCache {
    let capacity: Int
    var head = Node(-1, -1)
    var tail = Node(-1, -1)
    var hashTable = [Int: Node]()

    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.previous = head
    }

    func get(_ key: Int) -> Int {
        if let node = hashTable[key] {
            remove(node)
            insertToHead(node)
            return node.value
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        if let node = hashTable[key] {
            remove(node)
        }

        let node = Node(key, value)
        hashTable[key] = node
        insertToHead(node)

        if hashTable.count > capacity {
           evicts()
        }
    }

    // MARK: - Helpers

    /// Helper
    private func insertToHead(_ node: Node) {
        node.next = head.next
        node.previous = head

        head.next?.previous = node
        head.next = node
    }

    /// Helper
    private func remove(_ node: Node) {
        node.previous?.next = node.next
        node.next?.previous = node.previous
    }

    /// 移除最舊的資料
    private func evicts() {
        guard let node = tail.previous else { return }
        remove(node)
        hashTable[node.key] = nil
    }
}
```

``` swift
class Node {
    let key: Int
    let value: Int
    var previous: Node?
    var next: Node?

    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}
```
