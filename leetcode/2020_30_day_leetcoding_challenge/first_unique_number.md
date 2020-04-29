# First Unique Number

從題意和暗示來看，看來可以用 LRU 來解，
不過還沒完全理解，所以先貼程式碼。

## 非 LRU

``` swift
class FirstUnique {

    var counts = [Int: Int]()
    var queue = [Int]()
    
    init(_ nums: [Int]) {
        for number in nums {
            add(number)
        }
    }
    
    func showFirstUnique() -> Int {
        while !queue.isEmpty && counts[queue[0]]! > 1 {
            queue.removeFirst()
        }
        
        return queue.isEmpty ? -1 : queue[0]
    }
    
    func add(_ value: Int) {
        let count = (counts[value] ?? 0) + 1
        counts[value] = count
        if count == 1 { queue.append(value) }
    }
}
```
