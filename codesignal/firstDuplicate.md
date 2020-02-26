# firstDuplicate

- <https://app.codesignal.com/interview-practice/task/pMvymcahZ8dY4g75q/description>

## 20200226

### 1

``` swift
func firstDuplicate(a: [Int]) -> Int {
    if a.isEmpty { return -1 }
    var seen = Set<Int>()
    
    for number in a {
        if !seen.contains(number) {
            seen.insert(number)
        } else {
            return number
        }
    }

    return -1
}
```
