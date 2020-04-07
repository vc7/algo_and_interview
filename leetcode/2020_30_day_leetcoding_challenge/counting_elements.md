# Counting Elements

- <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/528/week-1/3289/>

## Code

- Time complexity: O(nlogn) （因為有用到排序）
- Space commplexity: O(n)

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

### Result

- <https://leetcode.com/submissions/detail/321197249/>

``` text
Runtime: 20 ms
Memory Usage: 21.2 MB
```

## Code - 2

沒有用 sort 所以時間複雜度可以降到 O(n) ， Runtime 明顯有變快。

- Time complexity: O(nlogn) （因為有用到排序）
- Space commplexity: O(n)

``` swift
class Solution {
    func countElements(_ arr: [Int]) -> Int {
        var seen = Set(arr)
        var count = 0

        for number in arr {
            if seen.contains(number+1) {
                count += 1
            }
        }

        return count
    }
}
```

### Result - 2

- <https://leetcode.com/submissions/detail/321210924/>

``` text
Runtime: 16 ms
Memory Usage: 20.7 MB
```

## Code - 3

可以直接找 array 裡面有沒有存在就好。

- Time complexity: O(n)
- Space commplexity: O(1)

``` swift
class Solution {
    func countElements(_ arr: [Int]) -> Int {
        var count = 0

        for number in arr {
            if arr.contains(number+1) {
                count += 1
            }
        }

        return count
    }
}
```

### Result - 3

- <https://leetcode.com/submissions/detail/321219116/>

``` text
Runtime: 20 ms
Memory Usage: 21.2 MB
```
