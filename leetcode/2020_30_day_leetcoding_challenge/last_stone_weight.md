# Last Stone Weight

資料結構及演算法： `Backtracking`

- 挑戰頁面 - <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3297/>
- 題目原頁面 - [1046. Last Stone Weight](https://leetcode.com/problems/last-stone-weight/)

## 事先排序

有看到要找最大兩個值，於是就先降冪排序了。

## Heap 好麻煩 XDDDDD

Swift 不像其他語言有 heapq (python) 可以用，實作 max heap 覺得浪費生命又覺得ㄎㄧㄤ，想要減少解題時間於是就決定用 backtracking 了。後續再來做整套 heap 看看。

## Backtracking

要 backtracking 的話就是要先訂下遞迴的結束條件。

- 結束條件 ① - 空陣列的話回傳 0
- 結束條件 ② - 只有一個元素的話回傳該元素

### Subroutine （子處理）的主要內容

取得第一大和第二大數的差值，如果不是零就找到對應的位置插入。

#### 找位置的嘗試

試過三個方法 ① 從最大那側開始找 ② 從最小那側開始找 ③ 用 binary tree 找。而由於通常差值都會偏小，很快就有辦法跳離尋找的 loop，所以後來挑 ② 定下來。

實際嘗試過後 runtime 的差別： ② (beats 100.00%) > ① (beats 48.61%) > ③ (beats 12.50%)

## Code

``` swift
class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var sortedStones = stones.sorted(by: >)
        return smash(&sortedStones)
    }

    func smash(_ stones: inout [Int]) -> Int {
        if stones.isEmpty { return 0 }
        if stones.count == 1 { return stones[0] }

        let first = stones.removeFirst()
        let second = stones.removeFirst()
        let difference = first - second

        if difference > 0 {
            var index = stones.count - 1
            while index >= 0  {
                if stones[index] >= difference {
                    break
                }
                index -= 1
            }
            stones.insert(difference, at: index + 1)
        }
        return smash(&stones)
    }
}
```

## 複雜度分析

如果有錯請指正 :rabbit:

n 為陣列長度。

- 時間複雜度： O(nlogn + n^2) → O(n^2)
  - 排序先用掉 O(nlogn)
  - 走訪過程用 O(n), 裡面包了找插入位置用 O(n) 。雖然不願意，但是應該是 O(n^2) 。
- 空間複雜度： O(n)
  - 排序後用掉 O(n)
  - 走訪過程至少可以算 3n (first, second, difference) ，簡化後是 O(n)

## 執行結果

``` text
Runtime: 0 ms (beats 100.00%)
Memory Usage: 21.4 MB
```

## 其他覺得有趣的解

- [@nalydadad](https://twitter.com/nalydadad) - <https://leetcode.com/problems/last-stone-weight/discuss/575493/Elegant-swift-solution>
