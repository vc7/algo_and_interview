# 1323. Maximum 69 Number

- <https://leetcode.com/problems/maximum-69-number/>

最直覺的寫法，把最高位的 6 轉成 9 然後回傳結果：

``` swift
class Solution {
    func maximum69Number (_ num: Int) -> Int {
        var string = Array(String(num))
        for index in 0..<string.count {
            if string[index] == "6" {
                string[index] = "9"
                break
            }
        }
        return Int(String(string))!
    }
}
```

用計算的方式，就可以不用一直轉型別了

``` swift
class Solution {
    func maximum69Number (_ num: Int) -> Int {
        var number = num
        var diff = 0
        var digits = 1
        
        while number > 0 {
            diff = max((9 - number % 10) * digits, diff)
            number /= 10
            digits *= 10
        }
        
        return num + diff
    }
}
```

- <https://leetcode.com/submissions/detail/327069440/>
