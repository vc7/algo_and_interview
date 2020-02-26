# sudoku2

- <https://app.codesignal.com/interview-practice/task/SKZ45AF99NpbnvgTn/description>

## 20200226

### 1

``` swift
func sudoku2(grid: [[Character]]) -> Bool {
    var seen = Set<String>()
    for row in 0..<9 {
        for column in 0..<9 {
            let current = grid[row][column]
            if current == "." { continue }
            let rowLog = "\(current), r \(row)"
            let columnLog = "\(current), c \(column)"
            let subGrid = "\(current), sg (\(row / 3), \(column / 3))"
            if !seen.contains(rowLog) &&
               !seen.contains(columnLog) &&
               !seen.contains(subGrid) {
                seen.insert(rowLog)
                seen.insert(columnLog)
                seen.insert(subGrid)
            } else {
                return false
            }
        }
    }
    return true
}
```
