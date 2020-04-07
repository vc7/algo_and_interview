# Group Anagrams

`Hash Table` `String`

- <https://leetcode.com/explore/featured/card/30-day-leetcoding-challenge/528/week-1/3288/>
- <https://leetcode.com/problems/group-anagrams/>

解題方向有想對，就是用 hash table 。

## 途中有疑問的地方

原本用 `Set<Array(string)>` 產生 `Set<[Character]>` 來當成 key 值。但是因為用 Set 的話，有字串中有重複字元的話就會被短縮成兩個或一個，會導致不同組合的被分到同一組。例如 `aab` 和 `abb` 。因此還是要用 `String(string.sorted())` ，產出的結果才會是正確的。

## Code

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

### Result

- <https://leetcode.com/submissions/detail/320713985/>

``` text
Runtime: 188 ms (93.53%)
Memory Usage: 23.7 MB
```

## Test Cases

``` text
["eat","tea","tan","ate","nat","bat"]
```

``` text
["hos","boo","nay","deb","wow","bop","bob","brr","hey","rye","eve","elf","pup","bum","iva","lyx","yap","ugh","hem","rod","aha","nam","gap","yea","doc","pen","job","dis","max","oho","jed","lye","ram","pup","qua","ugh","mir","nap","deb","hog","let","gym","bye","lon","aft","eel","sol","jab"]
```
