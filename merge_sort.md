# Merge Sort

概念：先把每個元素逐步分開到一個陣列一個元素，接著再逐一地排序並合併回去。是一個 devide and conquer 的演算法。

每兩組陣列在合併的時候，因為需要標示目前處理的位置，所以必須給左堆和右堆都個宣告一個 flag 給他。

而對 Swift 來說，在 slice 的時候都需要再重新建立一次 Array ，直覺上非常的消耗空間。

## 時間複雜度

O(nlogn)

### 證明

WIP

## 主 method

``` swift
func mergeSort<T>(_ array: [T]) -> [T] where T: Comparable {
    // 只有一件的話，就不需要再處理直接返回
    guard array.count > 1 else { return array }
    
    let middle = array.count / 2
    // ① 用遞迴呼叫自己的方式處理左側
    let leftPile = mergeSort(Array(array[0..<middle]))
    // ② 用遞迴呼叫自己的方式處理右側
    let rightPile = mergeSort(Array(array[middle..<array.count]))
    
    // ③ 再合併起來
    return merge(leftPile: leftPile, rightPile: rightPile)
}
```

## 進行排序和合併的程式碼

``` swift
func merge<T>(leftPile: [T], rightPile: [T]) -> [T] where T: Comparable {
    var leftFlag = 0
    var rightFlag = 0
    
    var pile = [T]()
    pile.reserveCapacity(leftPile.count + rightPile.count)
    
    while leftFlag < leftPile.count && rightFlag < rightPile.count {
        let left = leftPile[leftFlag]
        let right = rightPile[rightFlag]
        
        if left > right {
            pile.append(right)
            rightFlag += 1
        } else if left < right {
            pile.append(left)
            leftFlag += 1
        } else {
            pile.append(left)
            leftFlag += 1
            
            pile.append(right)
            rightFlag += 1
        }
    }
    
    if leftFlag < leftPile.count {
        pile.append(leftPile[leftFlag])
    }
    
    if rightFlag < rightPile.count {
        pile.append(rightPile[rightFlag])
    }
    
    return pile
}
```

## 執行

``` swift
let array = [9, 1, 3, 5, 3]
let result = mergeSort(array)
```

## 參考

- https://github.com/raywenderlich/swift-algorithm-club/tree/master/Merge%20Sort
- https://softwareengineering.stackexchange.com/a/297232/356908
- https://softwareengineering.stackexchange.com/a/297203/356908
