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

或

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
        return queue.isEmpty ? -1 : queue[0]
    }
    
    func add(_ value: Int) {
        let count = (counts[value] ?? 0) + 1
        counts[value] = count
        if count == 1 {
            queue.append(value) 
        } else {
            while !queue.isEmpty && counts[queue[0]]! > 1 {
                queue.removeFirst()
            }
        }
    }
}
```

核心概念應該是，如果發現是已經加過的數字，也就是 count > 1 ，就不要加入。
程式碼本身也比實作一整個 LRU 還要簡潔。

## Result

- https://leetcode.com/submissions/detail/331721577/?from=/explore/challenge/card/30-day-leetcoding-challenge/531/week-4/3313/
