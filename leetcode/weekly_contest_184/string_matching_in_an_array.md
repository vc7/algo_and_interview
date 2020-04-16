# String Maching in an Array

``` swift
class Solution {
    func stringMatching(_ words: [String]) -> [String] {
        var sorted = words.sorted { $0.count < $1.count }
        var result = [String]()
        
        for index in 0..<(sorted.count - 1) {
            for subIndex in index..<sorted.count {
                if index != subIndex && sorted[subIndex].contains(sorted[index]) {
                    result.append(sorted[index])
                    break
                }
            }
        }
        return result
    }
}
```

https://leetcode.com/submissions/detail/325478763/

``` text
Runtime: 52 ms (beats 96.49%)
Memory Usage: 22 MB
```