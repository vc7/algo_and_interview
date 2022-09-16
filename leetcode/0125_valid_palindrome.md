# 125. Valid Palindrome

https://leetcode.com/problems/valid-palindrome/

```swift
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let characters = Array(s.lowercased()).filter { $0.isLetter || $0.isNumber }
        
        var left = 0
        var right = characters.count - 1
        
        while left < right {
            if characters[left] == characters[right] {
                left += 1 
                right -= 1
            } else {
                return false
            }
        }
        
        return true
    }
}
```1
