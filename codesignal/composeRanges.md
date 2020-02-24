# composeRanges

- https://app.codesignal.com/interview-practice/task/cHYqbQ9DiWmejAdeG/description

## 20200225

### 1

``` swift
func composeRanges(nums: [Int]) -> [String] {
    if nums.isEmpty { return [] }
    var start = nums[0]
    var result = [String(start)]

    // 要從 [1] 開始！
    for index in 1..<nums.count {
        if nums[index] - nums[index - 1] == 1 {
            result[result.count - 1] = "\(start)->\(nums[index])"
        } else {
            start = nums[index]
            result.append(String(start))
        }
    }

    return result
}
```
