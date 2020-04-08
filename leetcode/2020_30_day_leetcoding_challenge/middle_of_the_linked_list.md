# Middle of the Linked List

`Linked List` `Slow Fast Pointer`

- <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3290/>
- 原題目 - [876. Middle of the Linked List]<https://leetcode.com/problems/middle-of-the-linked-list/>

這題是還滿典型的 slow fast pointer 問題。
slow 一次移動一個位置，fast 一次移動兩個位置，當 fast 移動到尾端之後，
slow pointer 就自然會是正中間的節點。

判斷是否移動到尾端，用了 `fast != nil` 和 `fast?.next != nil` 的原因是，

- 有奇數個節點數的時候，需要用 `fast?.next != nil` 判斷
- 有偶數個節點數的時候，則需要用 `fast?.next != nil` 判斷

## Code

``` swift
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow: ListNode? = head
        var fast: ListNode? = head

        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
}
```

判斷是否移動到尾端，用了 `fast != nil` 和 `fast?.next != nil` 的原因是，

- 有奇數個節點數的時候，需要用 `fast?.next != nil` 判斷
- 有偶數個節點數的時候，則需要用 `fast?.next != nil` 判斷

奇數個：

``` text
 1 -> 2 -> 3
--------------
 s
 f
-------------- s 移動 1 個, f 移動 2 個
      s
           f
--------------
// 這時候 fast 已經抵達尾端，數列看也可以發現 fast 沒有下一個節點
```

偶數個：

``` text
 1 -> 2 -> 3 -> 4
--------------
 s
 f
-------------- s 移動 1 個, f 移動 2 個
      s
           f
-------------- s 移動 1 個, f 移動 2 個
           s
                    f
--------------
// 這時候 fast 已經超過數列，判定為到達尾端，同時也可以發現 fast 已經成為空值 (nil)
```

### Result

- <https://leetcode.com/submissions/detail/321698369/>