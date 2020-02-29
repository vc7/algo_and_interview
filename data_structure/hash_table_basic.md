# Hash Table (Basic)

用 Swift 實作 hash table 的基本功能。

## 結構

``` text
+---+  +-----+-------+--------+ +-----+-------+--------+
| 0 +--> key | value | next *-+-> key | value | next * |
+---+  +-----+-------+--------+ +-----+-------+--------+
| 1 +--> ...
+---+
| 2 +--> ...
+---+
```

- 用 Chanining (closed addressing) 的方式解決 collision
- 有一個主要陣列 bucket 來裝數個 linked list
- liked list 的每一個 node 裡面包含 key 和 value

## Code

``` swift
class HashTable<Key: Hashable, Value> {
    private class Node {
        var key: Key?
        var value: Value?
        var next: Node?
    }
    
    private var buckets: [Node]
    
    init(capacity: Int = 5) {
        buckets = [Node](repeating: Node(), count: capacity)
    }
    
    subscript(key: Key) -> Value? {
        get {
            return get(key)
        }
        set {
            if let value = newValue {
                update(key, value)
            } else {
                remove(key)
            }
        }
    }
    
    private func update(_ key: Key, _ value: Value) {
        let index =  abs(key.hashValue) %  buckets.count
        var preNode: Node?
        var node: Node? = buckets[index]
        
        while node != nil {
            if node?.key == key {
                node?.value = value
                return
            }
            
            preNode = node
            node = node?.next
        }
        
        let newNode = Node()
        newNode.key = key
        newNode.value = value
        preNode?.next = newNode
    }
    
    private func remove(_ key: Key) {
        let index =  abs(key.hashValue) %  buckets.count
        var node: Node? = buckets[index]
        
        while node != nil {
            if node?.next?.key == key {
                node?.next = node?.next?.next
                return
            }
            node = node?.next
        }
    }
    
    private func get(_ key: Key) -> Value? {
        let index =  abs(key.hashValue) %  buckets.count
        var node: Node? = buckets[index]
        
        while node != nil {
            if node?.key == key {
                return node?.value
            }
            node = node?.next
        }
        
        return nil
    }
}
```

## 參考資料

- [Data Structure: Hash Tables](https://www.youtube.com/watch?v=shs0KM3wKv8)
  - By Laakmann McDowell, 很簡單明瞭的解釋 hash table 的原理
- [Hash Tables and Hash Functions](https://www.youtube.com/watch?v=KyUTuwz_b7Q)
  - 從最根本講解 hash table 和可能 hash function 的做法
- [Hash Table：Chaining](http://alrightchiu.github.io/SecondRound/hash-tablechaining.html)
