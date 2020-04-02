# Happy Number

- <https://leetcode.com/explore/other/card/30-day-leetcoding-challenge/528/week-1/3284/>
- <https://leetcode.com/problems/happy-number>

## 記

看起來可以用佛洛伊德判圈法

## code

``` swift
class Solution {
    func isHappy(_ n: Int) -> Bool {
        var number = n
        var seen = Set<Int>()
        while !seen.contains(number) && number != 1 {
            seen.insert(number)
            var sum = 0
            while number != 0 {
                let remainder = number % 10
                sum += remainder * remainder
                number /= 10
            }
            number = sum
        }
        return number == 1
    }
}
```

### result

- <https://leetcode.com/submissions/detail/318541952/>

``` text
Runtime: 8 ms
Memory Usage: 20.8 MB
```
