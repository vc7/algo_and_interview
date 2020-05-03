# Jewels and Stones

資料結構與演算法： `Hash Table` `String`

- 挑戰頁面 - <https://leetcode.com/explore/featured/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3317/>
- 原題目 - [771. Jewels and Stones](https://leetcode.com/problems/jewels-and-stones/)

除了 Qiita ，我也有貼一篇在 LeetCode ，雖然內容不太一樣，有興趣的人也可以去看看：

- [Swift 1 liner, using higher order function](https://leetcode.com/problems/jewels-and-stones/discuss/608435/Swift-1-liner-using-higher-order-function)

## 思考方式

因為是要累計要出現的次數，於是第一個想到適合拿來用的方法是 `Hash Table` ，於是以自己最直覺的方式想出來的解法的步驟如下：

1. 計算每個字元出現的次數
2. 加總 J 裡面有出現的字元的次數

## 程式碼

題外話，沒有用 Set 的原因是， contains 的內部複雜度會是 O(n) 。而在 LeetCode 上的執行速度有時候又會因為用了 contains 會變慢很多，於是通常在解問題的時候傾向用 Dictionary 而不用 Set 。

``` swift
class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var hashTable = [Character: Int]()
        for character in S {
            hashTable[character] = (hashTable[character] ?? 0) + 1
        }

        var result = 0
        for character in J {
            if let count = hashTable[character] {
                result += count
            }
        }

        return result
    }
}
```

## 複雜度分析

- 時間複雜度： O(S.length + J.length)
  - O(S.length) - 走訪過 S 一次
  - O(J.length) - 走訪過 J 一次
- 空間複雜度： O(S.length)
  - 用來裝 S 計數的 hash table

## 執行結果

- <https://leetcode.com/submissions/detail/333167718/?from=/explore/featured/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3317/>

``` text
Runtime: 4 ms (beats 96.23%)
Memory Usage: 21.1 MB
```

## 其他解

## 官方文章

看官方的文章之後發現實作的方式不太一樣，就改用 Swift 寫寫看。

``` swift
// 4ms (beats 96.23%), 21.2 MB
// https://leetcode.com/submissions/detail/333175477/?from=/explore/featured/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3317/
class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        let hashSet = Set(Array(J))

        var result = 0
        for character in S {
            if hashSet.contains(character) {
                result += 1
            }
        }

        return result
    }
}
```

空間複雜度因為 hashTable(hashSet) 變成是為了 J 而建，所以變為 O(J.length) 。

### 善用 Swift 特性的 1-liner

可以用這種看起來很帥氣（咦）的寫法，只是 runtime 上就有點差了。
不過有避免掉要轉型成 Character 這一步，所以感受上是還是有比前面的幾個解法好一些。

``` swift
// 8ms (beats 76.89%), 20.8 MB
class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        return S.reduce(0) { $0 + (J.contains($1) ? 1 : 0) }
    }
}
```
