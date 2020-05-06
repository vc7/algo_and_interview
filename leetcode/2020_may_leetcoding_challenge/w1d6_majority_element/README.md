# 5 月 LeetCode 挑戰, W1D6, Majority Element, in Swift

演算法與資料結構： `Hash Table`

- 挑戰頁面 - [Majority Element](https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3321/)
- 原題目頁面 - [169. Majority Element](https://leetcode.com/problems/majority-element/)

## 想法

第一直覺是看到 hash table ，而這一題有另外一個解法，會另外開一篇來記錄。

### 步驟

- 依序走訪紀錄出現次數
- 當出現次數超過個數的一半時就回傳

## 程式碼

``` swift
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var hashTable = [Int: Int]()
        let halfSize = nums.count / 2

        for number in nums {
            let count = (hashTable[number] ?? 0) + 1
            if count > halfSize {
                // 超過就提前回傳
                return number
            }
            hashTable[number] = count
        }

        return -1
    }
}
```

### 複雜度分析

n 為傳入陣列的長度

- 時間複雜度： O(n) - 走訪過一次
- 空間複雜度： O(n) - hash table 用掉

### 執行結果

不是那麼漂亮 XD

``` text
Runtime: 148 ms (beats 75.09%)
Memory Usage: 21.4 MB
```

- <https://leetcode.com/submissions/detail/335269316/?from=/explore/challenge/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3321/>
