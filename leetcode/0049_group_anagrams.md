# Group Anagrams

`Hash Table` `String`

- <https://leetcode.com/problems/group-anagrams/>
- 有出現在 leetcoding challenge -> [note](2020_30_day_leetcoding_challenge/group_anagrams.md)

## 20200407

### 1

``` swift
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result = [String: [String]]()

        for string in strs {
            let sorted = String(string.sorted())

            var current = result[sorted] ?? [String]()
            current.append(string)

            result[sorted] = current
        }
        return Array(result.values)
    }
}
```

#### Result

- <https://leetcode.com/submissions/detail/320713985/>

``` text
Runtime: 188 ms (93.53%)
Memory Usage: 23.7 MB
```
