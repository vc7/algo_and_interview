# Min Stack

## 題目

- 挑戰頁面 - <https://leetcode.com/explore/featured/card/30-day-leetcoding-challenge/529/week-2/3292/>
- 題目原頁面 - [155. Min Stack](https://leetcode.com/problems/min-stack/)

## 思維

看到 stack 類型的實作，直覺是想到用 linked list 實作，雖然這可能有點個人喜好的成份在裡面。
由於同時需要追蹤最小值，所以在 node 的基本實作中就加上一個 minValue 屬性。

### 用 Linked List 實作部分 Stack ADT

- ADT: 抽象資料型別, Abstract Data Type
- Stack ADT - <https://www.tutorialspoint.com/stack-adt-in-data-structures>

#### Linked List 的實作

Stack 有兩個基本特性：

- 需要可以快速的取的頂部的值
- 移除頂部的值，需要可以知道新的頂部的值

因此在串 linked list 的時候， 新的值或說是 node 必須放在最前面而不是最後面。因為以單向鏈結 (singly linked list) 的特性，是無法回溯前一個 node 。不過當然也可以實作雙向鏈結只是不想把解法弄的那麼複雜。

#### 追蹤最小值

由於題目期望每一個 method 的動作都是 constant time (O(1)) ，也就是在執行的時候不會動用到任何 loop 。

因此在每一次 push 的時候，需要 **比較** 新的值和最小值，並把 **紀錄** 下來比較出來的最新最小值。這樣子就有兩個好處。

- 移除 top 節點的時候，不需要再重新去找最小值。
- 因為有逐步紀錄最小值，因此可以像是 `peek()` 一樣達成 constant time 快速取得。

資料結構的部分，原先有想到拿另外一個陣列來追蹤最小值，但是這樣子需要另外一個變數來追蹤就可能會產生問題，因此把它併入 Node 裡面一併紀錄。這樣就可以讓 `getMin()` 也可以享受到像是 `peek()` 一樣的好處。

#### 節點的實作

以原始的 linked list 節點為基礎，幫他多加一個 minValue 的屬性。因為沒有變更的可能性，所以這邊就全部宣告為 `let` 。

``` swift
class Node<ValueType> {
    let value: ValueType
    let minValue: ValueType
    var next: Node<ValueType>?

    init(_ value: ValueType, _ minValue: ValueType) {
        self.value = value
        self.minValue = minValue
    }
}
```

## 完整的程式碼

``` swift
class MinStack {
    private var topNode: Node<Int>?

    init() {
        topNode = nil
    }

    func push(_ x: Int) {
        let node = Node<Int>(x, min(x, topNode?.minValue ?? Int.max))
        node.next = topNode
        topNode = node
    }

    func pop() {
        topNode = topNode?.next
    }

    func top() -> Int {
        return topNode?.value ?? 0
    }

    func getMin() -> Int {
        return topNode?.minValue ?? Int.max
    }

    class Node<ValueType> {
        let value: ValueType
        let minValue: ValueType
        var next: Node<ValueType>?

        init(_ value: ValueType, _ minValue: ValueType) {
            self.value = value
            self.minValue = minValue
        }
    }
}
```

### 複雜度分析

- 時間複雜度：每一個都是 O(1)
- 空間複雜度：如果全部都是 push ，令 n 為 push 的數量。雖然 value 和 minValue 為 2n，簡化後空間複雜度為 O(n)

### 結果

- <https://leetcode.com/submissions/detail/322705070/>

``` text
Runtime: 96 ms (94.4%)
Memory Usage: 22.9 MB
```
