# W1D1. First Bad Version

五月 LeetCode 也有挑戰活動，應該是跟疫情多少有關係。
由於回到第一週變得簡單許多所以有鬆了一口氣。

演算法與資料結構： `Binary Search` `Array`

## 題意和解法關鍵

- 挑戰頁面： <https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3316/>
- 原題目： [278. First Bad Version](https://leetcode.com/problems/first-bad-version/)

給出一個最大數，找出傳入 isBadVersion 方法會是 false 的第一個數值並回傳。

### 關鍵句子

> You should minimize the number of calls to the API.

根據這句話就可以確定這是一題二元搜尋法的題目。

為什麼這麼說呢？

從題意來看最簡單的走法方式會是依序走訪 O(n) ，而有了這句話就會知道 LeetCode 的編譯器十之八九會讓 O(n) 超時或是超過存取次數。

而降這種解法的時間複雜度的方式就只剩下二元搜尋法 (binary search) 。在用了二元搜尋法之後的時間複雜度，就會降到 O(logn)。

### 相關題目

相關題目可以看四月的這題： [Leetcode 30 天挑戰, Week 3 Day 7, Leftmost Column with at Least a One, in Swift](https://qiita.com/vc7/items/7022af54c5e7b0703366)

而這題的題目也有出現類似的關鍵句子阻止我們用逐項走訪：

> Submissions making more than 1000 calls to BinaryMatrix.get will be judged Wrong Answer.

這一類句子就是「快用用看 binary search 吧！」的強烈訊號。

## 二元搜尋法的走法

是基本二元搜尋的變形。

- 如果該步驟的正中間為 false ，代表 false 的開頭會在 **左** 半邊，因此把 middle 指定給右指標，接著下個步驟就可以搜尋左半邊。
- 反之，若該步驟的正中間為 true ，代表 false 的開頭會在 **右** 半邊，因此把左指標改成 middle + 1，接著下個步驟就可以搜尋左半邊。
  - +1 是因為 middle 已經不符合需求，所以找 middle 的下一個位置
- 全部走訪完成之後，left 就會是結果

## 程式碼

``` swift
class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var head = 1 // 因為是從 1 開始，所以要注意不要從 0 開始
        var tail = n // 因為是到 n 為止，所以要注意上限不是 n - 1
        var middle = 0
        while head < tail {
            middle = head + (tail - head) / 2
            if isBadVersion(middle) {
                tail = middle
            } else {
                head = middle + 1
            }
        }
        return head
    }
}
```

## 複雜度分析

n 為傳入的 n 的值。

- 時間複雜度： O(logn)，因為是對一維陣列進行二元搜尋就是 O(logn)
- 空間複雜度： O(1)，只有用常數個變數

## 執行結果

- <https://leetcode.com/submissions/detail/332732885/?from=/explore/challenge/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3316/>

``` text
Runtime: 20 ms (beats 95.63%)
Memory Usage: 20.9 MB
```
