# Quick Sort 快速排序

- <https://zh.wikipedia.org/wiki/%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F>

## 遞迴

``` swift
func quicksort(_ array: inout [Int]) {
    if array.isEmpty { return }
    quicksort(&array, 0, array.count - 1)
}

func quicksort(_ array: inout [Int], _ start: Int, _ end: Int) {
    if array.count <= 1 || start >= end { return }
    let pivotValue = array[end]
    var leftPointer = start
    var rightPointer = end - 1
    while leftPointer < rightPointer {
        while array[leftPointer] < pivotValue && leftPointer < rightPointer {
            leftPointer += 1
        }
        while array[rightPointer] >= pivotValue && leftPointer < rightPointer {
            rightPointer -= 1
        }
        swap(&array, leftPointer, rightPointer)
    }
    if array[leftPointer] > pivotValue {
        swap(&array, leftPointer, end)
    } else {
        leftPointer += 1
    }
    
    quicksort(&array, start, leftPointer - 1)
    quicksort(&array, leftPointer + 1, end)
}

func swap(_ array: inout [Int], _ aIndex: Int, _ bIndex: Int) {
    let tempValue = array[aIndex]
    array[aIndex] = array[bIndex]
    array[bIndex] = tempValue
}
```
