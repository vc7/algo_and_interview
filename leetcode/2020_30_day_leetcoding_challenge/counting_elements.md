# Counting Elements

- <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3289/>

## Code

- Time complexity: O(nlogn) （因為有用到排序）
- Space commplexity: O(1)

``` swift
class Solution {
    func countElements(_ arr: [Int]) -> Int {
        let sorted = arr.sorted()
        var count = 0
        var currentCount = 1
        var previous = sorted[0]+1

        for index in 0..<sorted.count {
            if index == 0 { continue }
            let current = sorted[index]

            if current + 1 == previous {
                currentCount += 1
            } else if current == previous {
                count += currentCount
                previous = current + 1
                currentCount = 1
            } else {
                previous = current + 1
                currentCount = 1
            }
        }
        return count
    }
}
```

- <https://leetcode.com/submissions/detail/321197249/>

``` text
Runtime: 20 ms
Memory Usage: 21.2 MB
```
