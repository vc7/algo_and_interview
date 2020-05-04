# Number Complement

資料結構與演算法： `Bit Manipulation` `Math`

- 挑戰頁面 - [Number Complement](https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3319/)
- 原題目頁面 - [476. Number Complement](https://leetcode.com/problems/number-complement/)

題意：找出一個數字的補數 (complement)

這一題最直覺會想到 bit manipulation ，因此我第一個寫出來的解法也用了 bit manipulation 。不過還有另外一個解法可以用單純的數學來解。

這篇就兩種解法都做紀錄吧！

## Bit Manipulation

做的事情簡化來說就是每一位數都做 bit 翻轉 (`^`，XOR, [參考](https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html))

以 4 (`100`) 為例，從二進位的表示來看答案會是 3 (`11`) ，我們做的事情實際上就是：

``` text
                                      101 (4)
4 XOR 2^0 -翻轉第一位-> 5 (101) 需處理：  10 (4 >> 1)
5 XOR 2^1 -翻轉第二位-> 7 (111) 需處理：   1 (2 >> 1)
7 XOR 2^2 -翻轉第三位-> 3 (011) 需處理：   0 (1 >> 1)
```

### 程式碼

``` swift
class Solution {
    func findComplement(_ num: Int) -> Int {
        var number = num
        var result = num
        var divisor = 1

        repeat {
            result ^= divisor // result = result ^ divisor 的簡化
            divisor <<= 1     // 向左 bitwise ，也可以寫成 divisor *= 2
            number >>= 1
        } while number != 0

        return result
    }
}
```

### 複雜度分析

- 時間複雜度： O(1)
  - 最多只會做 31 次，所以可以簡化成 O(1) 。 31 次： 32 位元的有符號數的範圍 -(2^31) ~ (2^31) 。
- 空間複雜度： O(1)
  - 只有用常數個變數來運算。

### 執行結果

``` text
Runtime: 4 ms (beats 83.33%)
Memory Usage: 20.7 MB
```

- <https://leetcode.com/submissions/detail/334286242/?from=/explore/challenge/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3319/>

## 單純的數學運算

逐步把參考值乘以 2 乘到直到比傳入值還大，參考值減去傳入值就是答案。

### 程式碼

``` swift
class Solution {
    func findComplement(_ num: Int) -> Int {
        var bigger = 0
        var binary = 1

        while bigger < num {
            bigger += binary
            binary <<= 1 // 或可以寫 binary *= 2
        }

        return bigger - num
    }
}
```

### 複雜度分析

和前一個解法一樣是 O(1) / O(1) 。

### 執行結果

``` text
Runtime: 4 ms (beats 83.33%)
Memory Usage: 21 MB
```

- <https://leetcode.com/submissions/detail/334299325/?from=/explore/challenge/card/may-leetcoding-challenge/534/week-1-may-1st-may-7th/3319/>

## 0 的話呢

題目有提到不會有 leading 0 ，所以可以理解成不需要理會 `0` 。
