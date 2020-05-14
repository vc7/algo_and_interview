# 5 月 LeetCode 挑戰, W2D4, Remove K Digits (Greedy), in Swift

資料結構與演算法： `Greedy` `Stack`

- 挑戰頁面 - [Remove K Digits](https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3328/)
- 原題目頁面 - [402. Remove K Digits](https://leetcode.com/problems/remove-k-digits/)

## 思考方式

核心是 Greedy ，分析範例 `1432219, k = 3` 之後，可以推測出核心的演算法是：

- 從最高位開始走訪， **因為我們要取最小值（題目要求）** ，所以只要高一位數字比自己還要大，如果還可以移除 (k > 0) 我們就移除高一位的數字

例如走到 `143` ，比起 `14` 我們更希望是 `13` 我們把 `4` 移除後加上 `3` ，所以這個步驟的結果是 `13` 。

### test case 1

接著用這個核心演算法來看比較特殊的 test case : `1230, k = 3` ，解為 `0`

這是一個一路升冪，只有最後一個降到 0 的一個數列。

- 一路會走到最後一個 0 ，一位一路上都沒有符合「高一位比自己大」的條件
- `1230` - `123` 和 `120` 比，我們比較想要 `120` ，所以我們移除 3 ， k - 1 之後剩下 `2`
- `120` - `12` 和 `10` 比，我們比較想要 `120` ，所以我們移除 2 ， k - 1 之後剩下 `1`
- `10` - `1` 和 `0` 比，我們比較想要 `0` ，所以我們移除 1 ， k - 1 之後剩下 `0`
- 結果為 `0`

### test case 2 - 無降冪

`111111, k = 3` 解應為 `111`

但是這個測試案例就算走完整個字串還是無法扣掉，因此我們要加上一個步驟：

- 當走訪完字串 k 卻沒有為 0 的話，就把最後的 k (剩餘值) 位都移除掉

因此 `111111` 移除最後的 3 位就是 `111`

### test case 3 - 高位數有 0

`100200, k = 1` 解應為 `200`

走完核心演算法之後，會剩下 `00200` ，而題目並不希望回傳的答案裡面會有高位數的 0 (leading zeros)

所以為了處理這個情況，在回傳之前，就必須再加上這個步驟

- 如果 num[0] 的內容是 `0` 就移除他，移除到 num[0] 不是 `0` 或是 num 為空為止

### 統整演算法

這題的思考步驟我自己是覺得有點複雜，需要考慮的邊界案例也比較多，在這邊來統整整個流程要做哪些事情。

1. 先導處理 - 如果 k 的初始值大於 num 的長度的話必定全部扣完，因此直接回傳 "0" 。
2. 核心 Greedy - 逐位走訪，只要高一位數字比自己還要大，如果還可以移除 (k > 0) 我們就移除高一位的數字
3. k 有剩餘的話，扣除最後位數
4. 移除 leading zeros

## 程式碼 （未優化）

``` swift
class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        // ①　排除 k > num 長度
        if k >= num.count { return "0" }

        // 例行公事， Swift 不擅長處理字串因此把它轉成 [Character]
        var characters = Array(num)
        // 轉換成 mutable
        var count = k

        // ② 核心 Greedy 演算法
        var index = 0
        while index < characters.count && count > 0 {
            while count > 0 && index > 0 && characters[index - 1] > characters[index] {
                characters.remove(at: index - 1)
                count -= 1
                // 目前的位數因為前一位被移除掉所以往前移，因此要 -1
                index -= 1
            }
            index += 1
        }

        // ③ 用掉剩下的 k
        characters.removeLast(count)

        // ④ 移除在高位數的 0
        while stack.first == "0" {
            characters.remove(at: 0)
        }

        return characters.isEmpty ? "0" : String(characters)
    }
}
```

### 複雜度分析

n 為 num 的長度

- 時間複雜度： O(n)
- 空間複雜度： O(n)
  - 陣列化的字串

### 執行結果

``` text
Runtime: 36 ms (beats 48.15)
Memory Usage: 21.4 MB
```

- <https://leetcode.com/submissions/detail/338828347/?from=/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3328/>

由於在執行時間上不是非常漂亮，我們就再來優化一下。

## 程式碼 （Stack 優化）

- 原先的寫法問題：當 num 的長度非常非常長的時候， 移除其中一個元素之後，他後面要重新配置（往前移動）記憶體空間所需要耗費的時間越多

因此為了不要讓尾巴不要成為我們的包袱，我們把處理好的另外的 stack 中，num 就只負責被走訪，而不用被執行移除的動作。這樣應該就可以大大改善執行時間。

Stack 則照往常直接拿 array 來用。

``` swift
class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {

        // ①　排除 k > num 長度
        if k >= num.count { return "0" }

        var count = k
        var stack = [Character]()

        // ② 核心 Greedy 演算法
        for character in num {
            while count > 0, let top = stack.last, top > character {
                stack.removeLast()
                count -= 1
            }
            stack.append(character)
        }

        // ③ 用掉剩下的 k
        stack.removeLast(count)

        // ④ 移除在高位數的 0
        while stack.first == "0" {
            stack.removeFirst()
        }

        return stack.isEmpty ? "0" : String(stack)
    }
}

```

### 複雜度分析

- 時間複雜度： O(n)
- 空間複雜度： O(n)
  - 用在 Stack

### 執行結果

``` text
Runtime: 24 ms (beats 100.00%)
Memory Usage: 21.5 MB
```

- <https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3328/>

## 結語

做完之後去找別人的文章或影片去看別人怎麼解釋，發現有些人都直接跳到「這題就是要用 stack」而沒有說為什麼該用 stack 。所以這篇我就多紀錄了原先的寫法和如何怎麼走到 stack 的想法。

又不小心有點長了 XDDDDD
