# 5 月 LeetCode 挑戰, W2D3, Find the Town Judge (兩個 Hash Table), in Swift

資料結構與演算法： `Hash Table`

- 挑戰頁面 - [Find the Town Judge](https://leetcode.com/explore/featured/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3325/)
- 原題目頁面 - [997. Find the Town Judge](https://leetcode.com/problems/find-the-town-judge/)

## 思考方式

題意要求我們 ~玩狼人殺~ 找出法官是誰。

而要記錄村民信任哪個鄉民的話，直覺上是拿 hash table 來用。

但是題目提到，法官必須不能信任任何人，因此就必須準備兩個 hash table

- 一個用來記錄某村民被誰信任
- 一個用來記錄某村民信任了誰

而判斷法官的方式就是

- 法官必須被 N - 1 個人信任（ `-1` 是因為不包含自己）
- 法官在信任了誰那個 hash table 不能有紀錄

## 程式碼

``` swift
class Solution {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        if trust.isEmpty { return N == 1 ? 1 : -1 }

        var trusted = [Int: Int]()
        var trusting = [Int: Int]()

        for pair in trust {
            trusting[pair[0]] = (trusting[pair[0]] ?? 0) + 1
            trusted[pair[1]] = (trusted[pair[1]] ?? 0) + 1
        }

        for (key, count) in trusted {
            if count == (N - 1) && trusting[key] == nil {
                return key
            }
        }

        return -1
    }
}
```

## 複雜度分析

n 為題目給的 N ，t 為 trust 的長度。

- 時間複雜度： O(t + n)
  - 紀錄時走了 O(t)
  - 尋找法官時走了 O(n)
- 空間複雜度： O(n)
  - 無論是信任還是被信任最大元素會是 n 個

## 執行結果

還滿慘的（笑），還有一個只用一個 hash table 來紀錄的寫法，稍晚再貼上來。

``` text
Runtime: 864 ms (beats 49.20%)
Memory Usage: 21.2 MB
```

- <https://leetcode.com/submissions/detail/337166274/?from=/explore/featured/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3325/>

- <https://leetcode.com/submissions/detail/337167930/>
