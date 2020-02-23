# containsDuplicates

- https://app.codesignal.com/interview-practice/task/CfknJzPmdbstXhsoJ/description
- Using HashMap

## 20200223

### 1

``` swift
func containsDuplicates(a: [Int]) -> Bool {
    var seen = Set<Int>()
    for number in a {
        if !seen.contains(number) {
            seen.insert(number)
        } else {
            return true
        }
    }
    return false
}
```
