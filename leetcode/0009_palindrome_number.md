# 9. Palindrome Number

## 20200208

### 1

原先想的太複雜，還有嘗試去組正常的數組，見下面 Failed 的程式碼。

接著思考了一下其實只要把反向的組出來即可，解法和判定字串的迴文會不一樣。

``` swift
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        
        var number = x
        var palindrome = 0
        
        while number != 0 {
            palindrome = palindrome * 10 + number % 10
            number /= 10
        }
        
        return x == palindrome
    }
}
```

#### Result

```
Runtime: 16 ms, faster than 100.00% of Swift online submissions for Palindrome Number.
Memory Usage: 20.9 MB, less than 14.29% of Swift online submissions for Palindrome Number.
```

#### Failed

``` swift
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        if x < 10 { return true }
        
        var number = x
        
        var isStarted = false
        var normal = 0
        var palindrome = 0
        
        var isPalindrome = false
        
        while number != 0 {
            let digit = number % 10
            
            if !isStarted {
                normal = digit
                palindrome = digit
                isStarted = true
            } else {
                normal = normal + digit * 10 // 發現這邊的計算有錯誤之後開始想應該不用那麼複雜
                palindrome = palindrome * 10 + digit
            }
            
            isPalindrome = normal == palindrome
            
            number /= 10
        }
        
        return isPalindrome
    }
}
```
