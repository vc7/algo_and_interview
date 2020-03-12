# 67. Add Binary

- <https://leetcode.com/problems/add-binary/>

## 20200312

### 1

``` swift
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        if a.isEmpty && b.isEmpty { return "" }
        if a.isEmpty { return b }
        if b.isEmpty { return a }
        
        let aCharacters = Array(a)
        let bCharacters = Array(b)
        
        var aPointer = aCharacters.count - 1
        var bPointer = bCharacters.count - 1
        var results = [Character]()
        var next = 0
        
        while aPointer >= 0 && bPointer >= 0 {
            let a = Int(String(aCharacters[aPointer]))!
            let b = Int(String(bCharacters[bPointer]))!
            
            insert(to: &results, next: &next, sum: a + b + next)
            
            aPointer -= 1
            bPointer -= 1
        }
        
        while aPointer >= 0 {
            let a = Int(String(aCharacters[aPointer]))!
            insert(to: &results, next: &next, sum: a + next)
            
            aPointer -= 1
        }
        
        while bPointer >= 0 {
            let b = Int(String(bCharacters[bPointer]))!
            insert(to: &results, next: &next, sum: b + next)
            
            bPointer -= 1
        }
        
        if next != 0 {
            results.insert("1", at: 0)
        }
        
        return String(results)
    }
    
    func insert(to array: inout [Character], next: inout Int, sum: Int) {
        let digit = sum % 2
        next = sum / 2
        array.insert(digit == 1 ? "1" : "0", at: 0)
    }
}
```

#### Result

``` text
Runtime: 16 ms, faster than 70.63% of Swift online submissions for Add Binary.
Memory Usage: 21.4 MB, less than 16.67% of Swift online submissions for Add Binary.
```
