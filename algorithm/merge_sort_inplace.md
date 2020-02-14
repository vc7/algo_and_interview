# 合併排序

省空間，用 inplace 的方式實作

## 主 method

``` swift
func mergesort(_ array: inout [Int]) {
    if array.count <= 1 { return }
    mergesortRecursive(&array, 0, array.count - 1)
}
```

## 遞迴和合併的 method

``` swift
func mergesortRecursive(_ array: inout [Int], _ start: Int, _ end: Int) {
    print("(\(start), \(end))")
    if start < end {
        // midIndex 要從 start 開始算
        let midIndex = start + (end - start) / 2
        mergesortRecursive(&array, start, midIndex)
        mergesortRecursive(&array, midIndex + 1, end)
        sort(&array, start, end)
    }
}

func sort(_ array: inout [Int], _ start: Int, _ end: Int) {
    if end <= start { return }
    // midIndex 要從 start 開始算
    let midIndex = start + (end - start) / 2 + 1
    var startLeft = start
    var startRight = midIndex

    if array[midIndex] >= array[midIndex - 1] { return }

    while startLeft <= midIndex && startRight <= end {
        if array[startRight] >= array[startLeft] {
            // 因為已經大於了，可以不用理會他， += 1 後繼續檢查下一個
            startLeft += 1
        } else {
            let value = array[startRight]
            var index = startRight

            while index > startLeft {
                array[index] = array[index - 1]
                index -= 1
            }

            // 把暫存的值放入第一個位置
            array[index] = value

            // 遞增左起始和右起始的指標
            startLeft += 1
            startRight += 1
        }
    }
}
```
