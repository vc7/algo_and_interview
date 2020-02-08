# Binary Search

- O(logn)
- Devide and conquer

## 實作筆記

設定 lower bound 以及 upper bound 來決定要尋找的範圍

``` text
  +-- lowerBound (初始值: 0)
  |
  V
+---+---+---+---+
| 4 | 5 | 6 | 7 |
+---+---+---+---+
|[0]|[1]|[2]|[3]|
+---+---+---+---+
                  ^
                  |
                  +--- upperBound (初始值: array.count)
```

### 步驟

① 找 `中間點`

算法： `lowerBound` + ((`upperBound` - `lowerBound`) / 2)

- (`upperBound` - `lowerBound`) 就是目前尋找範圍的長度，除以 2 之後取得中間位置所需要的位移 index 數
- lowerBound 再加上需要位移的 index 數就可以取得當前的 `中間點`

② 如果中間點對應到的值有符合需求的話就可以直接回傳

③ `小於` 目標值的話，意味著需要找他的 `右 `邊，所以這時候就把 `lowerBound` 改成 `中間點 index + 1` 改變要尋找的範圍

④ `大於等於` 目標值的話，意味著需要找他的 `左` 邊，所以這時候就把 `lowerBound` 改成 `中間點 index + 1` 改變要尋找的範圍

接著重複 ①~④ 直到 `lowerBound` >= `upperBound` 為止

### Swift code

``` swift
func binarySearch<T>(array: [T], target: T) -> Int? where T: Comparable {
    // 初始化標示尋找區域的變數
    var lowerBound = 0
    var upperBound = array.count
    
    // 開始尋找
    while lowerBound < upperBound {
        // 決定中間點
        let midIndex = lowerBound + (upperBound - lowerBound) / 2

        if array[midIndex] == target {
            return midIndex
        } else if array[midIndex] < target {
            // 找右半邊
            lowerBound = midIndex + 1
        } else {
            // 找左半邊
            upperBound = midIndex
        }
    }
    
    return nil
}
```
