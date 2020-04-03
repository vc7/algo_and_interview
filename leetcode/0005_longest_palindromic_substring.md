# 5. Longest Palindromic Substring

## 20200208

### 1

參考： https://www.youtube.com/watch?v=y2BD4MJqV20

``` swift
class Solution {
    func longestPalindrome(_ string: String) -> String {
        if string.count < 2 { return string }
        var start = 0
        var end = 0
        var characters = Array(string)
        
        for index in 0..<characters.count {
            // 中心的字是單一個字，例如 "racecar"
            let lengthOdd = findPalindromeLength(characters, index, index)
            // 當中心的字是兩個字，例如 "abba"
            let lengthEven = findPalindromeLength(characters, index, index + 1)
            
            // 兩者取得大的
            let length = max(lengthOdd, lengthEven)
            
            // 如果需要就更新 start, end 
            if length > end - start {
                start = index - (length - 1) / 2
                end = index + length / 2
            }
        }
        
        return String(characters[start...end])
    }
    
    func findPalindromeLength(_ characters: [Character],_ left: Int,_ right: Int) -> Int {
        var leftPointer = left
        var rightPointer = right
        while leftPointer >= 0 && rightPointer < characters.count && characters[leftPointer] == characters[rightPointer] {
            leftPointer -= 1
            rightPointer += 1
        }
        
        return rightPointer - leftPointer - 1
    }
}
```

#### Result

```
Runtime: 276 ms, faster than 60.74% of Swift online submissions for Longest Palindromic Substring.
Memory Usage: 21.2 MB, less than 100.00% of Swift online submissions for Longest Palindromic Substring.
```
