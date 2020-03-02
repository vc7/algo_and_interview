# areFollowingPatterns

- <https://app.codesignal.com/interview-practice/task/3PcnSKuRkqzp8F6BN/description>

## 20200302

### 1

用雙 hashmap

``` swift
func areFollowingPatterns(strings: [String], patterns: [String]) -> Bool {
    var patternMap = [String: String]()
    var stringMap = [String: String]()

    for index in 0..<strings.count {
        let string = strings[index]
        let pattern = patterns[index]

        if let value = patternMap[pattern], value != string {
            return false
        }

        if let value = stringMap[string], value != pattern {
            return false
        }

        stringMap[string] = pattern
        patternMap[pattern] = string
    }

    return true
}
```
