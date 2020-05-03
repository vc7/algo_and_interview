# Ransom Note

資料結構及演算法： `Hash Table` `String`

- 挑戰頁面 - [Ransom Note](https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3318/)
- 原題目- [383. Ransom Note](https://leetcode.com/problems/ransom-note/)

## 解題想法

這題直覺上也是 hash table 問題。
基本步驟如下：

1. 把 ransom note 中有哪些字元，各出現過幾次記錄下來
2. 走訪 magazine 的每一個字元有出現就把計數減一

### 資料結構的使用

和昨天的題目 ([Jewels and Stones](https://qiita.com/vc7/items/395c629ac3d1a0fc18cf)) 不一樣的地方是，前一天題目有提到 jewels(`J`) 裡面的值可以保證獨一無二 (distinct) ，因此由這個限制來看，解題的時候就可以用 set 。

但是今天從題目來看無論是 ransomNote 還是 magazine ，其中的字元都有可能會重複出現，因此應該要用 dictionary 而不能用 set 。

## 程式碼

``` swift
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        // 提早排除
        if ransomNote.count > magazine.count { return false }

        var hashTable = [Character: Int]()

        // 計數
        for character in ransomNote {
            hashTable[character] = (hashTable[character] ?? 0) + 1
        }

        // 比對
        for character in magazine {
            if let count = hashTable[character] {
                hashTable[character] = (count - 1 == 0) ? nil : count - 1
                if hashTable.isEmpty { return true }
            }
        }

        return hashTable.isEmpty
    }
}
```

## 複雜度分析

r 指 ransomNote, m 指 magazine。

- 時間複雜度： O(m.length)
  - 如果 ransomNote 的長度大於 magazine 的長度就代表以 magazine 的內容無法構成。有了這個條件判斷並排除明顯無法達成要求的測試案例，時間複雜度就能夠從 O(r.length + m.length) 簡化到 O(m.length) 。
- 空間複雜度： O(r.length)
  - 用在紀錄 ransomNote 的 hash table

## 執行結果

``` text
Runtime: 32 ms (beats 98.48%)
Memory Usage: 21.3 MB
```

- <https://leetcode.com/submissions/detail/333766232/?from=/explore/challenge/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3318/>

### 觀察

提前排除的那個判斷無論有沒有加並沒有讓 runtime 有改變。其中也有可能是因為測試案例並沒有讓這個判斷能有顯著表現。
