# 5 月 LeetCode 挑戰, W2D5, Single Element in a Sorted Array (Hash Table, XOR, Binary Search), in Swift

資料結構與演算法： `Hash Table` `XOR` `Binary Search`

- 挑戰頁面 - [Single Element in a Sorted Array](https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3327/)
- 原題目頁面 - [540. Single Element in a Sorted Array](https://leetcode.com/problems/single-element-in-a-sorted-array/)

## 前言

這題雖然看似簡單不過很有趣。這題可以用很多視點切入也是練習不同解法的好機會。

這題是要求回傳在已排序的陣列裡面，唯一一個數量不是兩組的數字。加上題目中有要求時間複雜度要達到 O(logn) ，因此可以想到以下這幾種解法。

- Hash Table, O(n)
- XOR, O(n)
- Binary Search, O(logn)

雖然前兩個沒有達到需求，不過就當作練習和紀錄吧！

## Hash Table

這個寫法雖然在有些題目很常見：第一次走訪紀錄次數，第二次走訪取期望值。不過在這題的表現非常差。

``` swift
class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var hashTable = [Int: Int]()

        for number in nums {
            hashTable[number] = (hashTable[number] ?? 0) + 1
        }

        for (key, value) in hashTable {
            if value == 1 { return key }
        }

        return -1
    }
}
```

### 複雜度分析

n  為 nums 的元素數量

- 時間複雜度： O(n)
- 空間複雜度： O(n)

### 執行結果

``` text
Runtime: 76 ms (beats 14.81%)
Memory Usage: 21.1 MB
```

## XOR

由於對兩個相同數字做 XOR 運算之後會得到 0 ，因此在邊走訪邊 XOR 之後剩下來的值就會是落單的值。

``` swift
class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var result = 0

        for number in nums {
            // XOR 運算
            result ^= number
        }

        return result
    }
}
```

### 複雜度分析

n 為 nums 的元素數量

- 時間複雜度： O(n)
- 空間複雜度： O(1)

### 執行結果

執行結果一樣很慘 XDDDD

``` text
Runtime: 72 ms (beats 14.81%)
Memory Usage: 21 MB
```

## Binary Search - 1

如果看到 O(n) 要降到 O(logn) 的話，第一個就要想到 binary search ，接下來就是看要怎麼變 binary search 的寫法了。

### 思考方式

基礎的想法是

- 如果 middle 的右邊的值和 middle 一樣的話，落單的值就會有可能在左半邊
  - 例如： `[1,1,2,3,3,4,4]`
- 如果 middle 的左邊的值和 middle 一樣的話，落單的值就會有可能在右半邊
  - 例如： `[1,1,2,2,3,4,4]`

但是當有一些落單值在頭或尾的時候，這樣的算法就會有問題

- 例如： `[1,2,2,3,3]`
  - middle 左邊的值和 middle 一樣，但是落單的值在左半邊
- 例如： `[1,1,2,2,3]`
  - middle 右邊的值和 middle 一樣，但是落單的值在右半邊

統整之後，可以得出下面的結論：

- middle `左` 邊的值和 middle 一樣
  - 當半邊的數量各是偶數的時候，落單值會在左半邊
  - 當半邊的數量各是奇數的時候，落單值會在右半邊
- middle `右` 邊的值和 middle 一樣
  - 當半邊的數量各是偶數的時候，落單值會在右半邊
  - 當半邊的數量各是奇數的時候，落單值會在左半邊

### 程式碼

``` swift
class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1

        while left < right {
            let middle = left + (right - left) / 2
            if nums[middle - 1] == nums[middle] {
                if (right - middle) % 2 == 0 {
                    right = middle - 2
                } else {
                    left = middle + 1
                }
            } else if nums[middle + 1] == nums[middle] {
                if (right - middle) % 2 == 0 {
                    left = middle + 2
                } else {
                    right = middle - 1
                }
            } else {
                return nums[middle]
            }
        }

        return nums[left]
    }
}
```

### 複雜度分析

- 時間複雜度： O(logn) - binary search 嘛
- 空間複雜度： O(1)

### 執行結果

變快惹 XDDDD

``` text
Runtime: 56 ms (beats 100.00%)
Memory Usage: 21.4 MB
```

- <https://leetcode.com/submissions/detail/338292416/?from=/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3327/>
- <https://leetcode.com/submissions/detail/338308227/>

## Binary Search - 2

第二種 binary search 的方式是利用題目的條件，來對 binary search 再做變化。

### 思考方式

根據題目，可以知道數字基本上是依序成對存在的。因此只要以偶數 index 為基礎走訪即可。

首先，確保每一次的 middle 會在偶數 index 上。如果 middle 是在奇數位置，就往前移一位到偶數 index 上。

- middle 和 middle + 1 相等
  - 代表從 0 開始到 middle 的前一項之間都是成對存在，落單的一定在右半邊
- middle 和 middle + 1 不相等
  - 代表從 0 開始到 middle 為止（包含 middle）有可能有不成對的數字存在

### 程式碼

``` swift
class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1

        while left < right {
            var middle = left + (right - left) / 2

            // 確保 middle 是在偶數的 index
            if middle % 2 == 1 { middle -= 1 }

            if nums[middle] == nums[middle + 1] {
                left = middle + 2
            } else {
                right = middle
            }
        }

        return nums[left]
    }
}
```

### 複雜度分析

- 時間複雜度： O(logn) - binary search
- 空間複雜度： O(1)

### 執行結果

``` text
Runtime: 48 ms (beats 100.00%)
Memory Usage: 21.3 MB
```

- <https://leetcode.com/submissions/detail/338321081/>