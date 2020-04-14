# Contiguous Array

資料結構與演算法： `Hash Table`

## 題目

- 挑戰頁面 - <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3298/>
- 題目原頁面 - [525. Contiguous Array](https://leetcode.com/problems/contiguous-array/)

題目本身似乎會有點難理解，透過試了幾個 test cases 之後理解到他是要問：找出一個子陣列，該子陣列中 0 和 1 的數量會相同。並回傳該子陣列的長度。

## 想法

?

## 程式碼

``` swift
class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var hashTable = [Int:Int]()
        var maxLength = 0
        var sum = 0

        for index in 0..<nums.count {
            let number = nums[index]
            sum = sum + (number == 1 ? 1 : -1)

            if sum == 0 {
                let currentLength = index + 1
                maxLength = max(maxLength, currentLength)
            }

            if let storedIndex = hashTable[sum] {
                let currentLength = index - storedIndex
                maxLength = max(maxLength, currentLength)
            } else {
                hashTable[sum] = index
            }
        }
        return maxLength
    }
}
```

https://leetcode.com/submissions/detail/324233976/

``` text
Runtime: 616 ms (beats 95.00%)
Memory Usage: 22.1 MB
```

## Testcases

``` text
[0,1]
[1,0,1]
[0,1,1,1,0]
[1,0,0,0,1]
[1,0,1,1,0,0,1,1,0,0]
[0,1,1,0,1,1,1,0]
[1,1,1,0,0,1,1,0]
[0,1,0,0,1,1,0]
[1]
```