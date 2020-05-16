# 5 月 LeetCode 挑戰, W3D2, Odd Even Linked List (Linked List), in Swift

資料結構與演算法： `Trie`

- 挑戰頁面 - [Odd Even Linked List](https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/536/week-3-may-15th-may-21st/3331/)
- 原題目頁面 - [328. Odd Even Linked List](https://leetcode.com/problems/odd-even-linked-list/)

## 題意

- 給一個單向鏈結
- 把這個單向鏈結分第奇數個及第偶數個兩堆，然後以把偶的那堆放在奇後面

例如

``` text
1 -> 3 -> 5 -> 7
```

第奇數個有 1 和 5 ，第偶數個有 3 和 7

因此結果是

``` text
1 -> 5 -> 3 -> 7
```

條件是：時間複雜度 O(n), 空間複雜到 O(1)

## 思考方式

- 宣告兩個鏈結，分別裝奇數項節點和偶數項節點
- 走訪完之後，把偶數項的鏈結接到奇數項鏈結的後面即可

注意點：

- 偶數的陣列需要把最後一個節點的 .next 設成 nil 。因為如果原先後面有接一個奇數節點的話，我們必須把它斷開。
  - 因為奇數鏈結的最後一個節點會接上偶數鏈結的第一個節點，因此不用特別做斷開的處理

### Linked List （鏈結）的操作技巧

- 建立 dummy node 作為 head node
  - 為了保留第一個位置的資訊，就像港口的繫纜柱一樣的作用把繩子定住。雖然和繩子繫在一起，但是他本身並沒有資料上的意義。
  - 回傳的時候回傳 head.next ， head.next 才是這個鏈結的真正起點
- 保留 `最後一個位置` 的節點資訊方便街上下一個節點

## 程式碼

``` swift
class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {

        var oddHead: ListNode? = ListNode()
        var oddCurrent: ListNode? = oddHead

        var evenHead: ListNode? = ListNode()
        var evenCurrent: ListNode? = evenHead

        /// 用來走訪傳入的鏈結
        var current: ListNode? = head
        /// 用來判斷現在是奇還是偶
        var isOdd = true

        while current != nil {
            if isOdd {
                oddCurrent?.next = current
                oddCurrent = oddCurrent?.next
            } else {
                evenCurrent?.next = current
                evenCurrent = evenCurrent?.next
            }
            isOdd = !isOdd
            current = current?.next
        }

        oddCurrent?.next = evenHead?.next
        evenCurrent?.next = nil

        return oddHead?.next
    }
}
```

## 複雜度分析

n 為總節點數

- 時間複雜度： O(n)
- 空間複雜度： O(1)
  - 標誌奇數偶數項的變數是常數個
  - dummy heads 也是常數個

## 執行結果

``` text
Runtime: 28 ms (beats 94.52%)
Memory Usage: 22 MB
```

https://leetcode.com/submissions/detail/340084668/?from=/explore/challenge/card/may-leetcoding-challenge/536/week-3-may-15th-may-21st/3331/