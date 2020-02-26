# rotateImage

- <https://app.codesignal.com/interview-practice/task/5A8jwLGcEpTPyyjTB/description>

## 20200226

### 1

``` swift
func rotateImage(a: [[Int]]) -> [[Int]] {
    if a.count <= 1 { return a }
    var result = a
    for row in 0..<result.count {
        for column in row..<result.count {
            if row == column { continue }
            let temp = result[row][column]
            result[row][column] = result[column][row]
            result[column][row] = temp
        }
    }

    for row in 0..<result.count {
        var left = 0
        var right = result.count - 1
        while left < right {
            let temp = result[row][right]
            result[row][right] = result[row][left]
            result[row][left] = temp
            left += 1
            right -= 1
        }

    }

    return result
}
```
