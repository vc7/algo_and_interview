# 1374. Generate a String With Characters That Have Odd Counts

不需要去想要怎麼組，偶數個就用 n-1 個 a 加上一個 b ，奇數個就直接給 n 個 a 。還滿有趣的！

``` swift
class Solution {
    func generateTheString(_ n: Int) -> String {
        if n % 2 == 0 {
            return String(repeating: "a", count: n - 1) + "b"
        } else {
            return String(repeating: "a", count: n)
        }
    }
}
```

https://leetcode.com/submissions/detail/327063171/

submit 數超少所以成績超差（咦），可是大家的寫法都差不多。