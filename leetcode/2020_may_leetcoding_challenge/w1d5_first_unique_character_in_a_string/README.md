# First Unique Character in a String

演算法與資料結構： `Hash Map`

- 挑戰頁面 - [First Unique Character in a String](https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3320/)
- 原題目頁面 - [387. First Unique Character in a String](https://leetcode.com/problems/first-unique-character-in-a-string/)

## 說明

資料結構來看還滿直覺可以想到 hash table ，這部分就不多說明了。

走兩次 (2-pass) 解法

- 第一次的走訪計算出現的次數
- 第二次的走訪尋找 hash table 中計數為 1 的字母。如果有找到第一個就直接回傳 index 。

## 程式碼

``` swift
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var hashTable = [Character: Int]()

        for character in s {
            hashTable[character] = (hashTable[character] ?? 0) + 1
        }

        var index = 0
        for character in s {
            if hashTable[character] == 1 { return index }
            index += 1
        }

        return -1
    }
}
```

### 複雜度分析

n 為字串 s 的長度。

- 時間複雜度： O(n)
  - 第一次和第二次的走訪為 O(n) + O(n) = O(2n) ，簡化係數後為 O(n) 。
- 空間複雜度： O(n) or O(1)
  - O(n) - 如果每一個字元都不一樣的話 hash table 的大小將會是 n
  - O(1) - 由題目可以知道 hash table 的大小最大是 26 ，或許可以視為常數

如果有什麼錯誤可以告訴我！

- <https://leetcode.com/submissions/detail/335269672/?from=/explore/challenge/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3321/>
