# 409. Longest Palindrome

https://leetcode.com/problems/longest-palindrome/

## 20220913

## 思維

## HashMap

需要組成回文，就需要知道字元的數量，因此使用 HashMap 走訪過一次字串搜集出現次數

## 回文組成規則

- 偶數一定能夠拿來用，因此直接加回 result
- 奇數使用方式
  - 出現次數最多的奇數可以被拿來放中間
  - 出現次數第二多以及以下的奇數，只要 -1 就可以拿來當偶數用

### 奇數邏輯

1. 只要碰到奇數就先 result += value - 1
2. 走訪時同時紀錄奇數有沒有出現過
3. 完全走訪完之後，如果有出現過奇數就把 result 加上 1

## 程式碼

```swift
class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var map = [Character: Int]()
        for character in s {
            map[character, default: 0] += 1
        }
        
        var result = 0
        var hasOdd = false

        for (_, value) in map {
            if value % 2 == 0 {
                result += value
            } else {
                hasOdd = true
                result += value - 1
            }
        }
        
        return result + (hasOdd ? 1 : 0)
    }
}
```
