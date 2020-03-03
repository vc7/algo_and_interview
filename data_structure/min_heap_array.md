# Min Heap - 陣列

- 逐步解說 - <https://www.youtube.com/watch?v=g9YK6sftDi0>
- Heaps(HackerRank) - <https://www.youtube.com/watch?v=t0Cq6tVNRBA>

``` swift
/// Defined based on **The abstract data type Priority Queue**
/// - <http://users.encs.concordia.ca/~chvatal/notes/pq.html>
protocol MinHeapProtocol {
    var isEmpty: Bool { get }
    func peak() -> Int?
    func remove()
    func insert(_ value: Int)
}

class MinHeap: MinHeapProtocol, CustomStringConvertible {
    private var array = [Int]()
    
    // MARK: - MinHeapProtocol
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    func peak() -> Int? {
        return array.first
    }
    
    func remove() {
        // 1. remove the first item
        // 2. move the last one to the first position
        // 3. heapify down the item if needed
        if array.isEmpty { return }
        let lastItem = array.removeLast()
        array[0] = lastItem
        heapifyDown()
    }
    
    func insert(_ value: Int) {
        // 1. append the value to the last position
        // 2. heapify up the item if needed
        array.append(value)
        heapifyUp()
    }
    
    // MARK: - CustomStringConvertible
    
    var description: String {
        return array.map(String.init).joined(separator: ", ")
    }
    
    // MARK: - Heapify Helpers
    
    private func heapifyDown() {
        // find the smaller leaf then swap with it
        let value = array[0]
        var currentIndex = 0
        if var smallerChildIndex = getSmallerChildIndex(of: currentIndex) {
            while value > array[smallerChildIndex] {
                array[currentIndex] = array[smallerChildIndex]
                array[smallerChildIndex] = value
                currentIndex = smallerChildIndex
                if let index = getSmallerChildIndex(of: currentIndex), index > 0 {
                    smallerChildIndex = index
                } else {
                    return
                }
            }
        }
    }
    
    private func heapifyUp() {
        // If the current value is smaller than its parent then swap the values
        var currentIndex = array.count - 1
        let value = array[currentIndex]
        var parentIndex = getParentIndex(of: currentIndex)
        while value < array[parentIndex] {
            array[currentIndex] = array[parentIndex]
            array[parentIndex] = value
            currentIndex = parentIndex
            parentIndex = getParentIndex(of: currentIndex)
        }
    }
    
    // MARK: - Traversing Helpers
    
    private func getParentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func getSmallerChildIndex(of index: Int) -> Int? {
        let leftIndex = index * 2 + 1
        let rightIndex = index * 2 + 1
        
        if leftIndex == array.count - 1 {
            return leftIndex
        }
        
        if rightIndex <= array.count - 1 {
            if array[leftIndex] < array[rightIndex] {
                return leftIndex
            } else {
                return rightIndex
            }
        }
        
        return nil
    }
}

```
