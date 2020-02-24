# nQueens

- https://app.codesignal.com/interview-practice/task/7u7oKqXoFdmh3vGyb/description

### 筆記

Place n queens on an n x n chessboard
That no queens are able to atack each other

the numbers in the result array might be index+1


如何確保對角線？

```
[0, 0] [0, 1] [0, 2] [0, 3]
[1, 0] [1, 1] [1, 2] [1, 3]
[2, 0] [2, 1] [2, 2] [2, 3]
[3, 0] [3, 1] [3, 2] [3, 3]
```

左上到右下對角座標 i - j 會是相同的
右上到左下對角座標 i + j 會是相同的

```
0 \    1 \    2 \    3 \    4 \      ／ 4
  [0, 0] [0, 1] [0, 2] [0, 3] [0, 4] ／ 5
  [1, 0] [1, 1] [1, 2] [1, 3] [1, 4] ／ 6
  [2, 0] [2, 1] [2, 2] [2, 3] [2, 4] ／ 7
  [3, 0] [3, 1] [3, 2] [3, 3] [3, 4] ／ 8
  [4, 0] [4, 1] [4, 2] [4, 3] [4, 4]
```

## 20200224

### 1

``` swift
func nQueens(n: Int) -> [[Int]] {
    if n == 0 { return [[]] }
    if n == 1 { return [[1]] }

    var results = [[Int]]()
    var result = [Int]()
    var seen = Set<String>()
    
    backtracking(&results, &result, &seen, n)

    return results
}

func backtracking(_ results: inout [[Int]], _ result: inout [Int], _ seen: inout Set<String>, _ numberOfQueens: Int) {
    // 停止條件 - result 的個數
    if result.count == numberOfQueens {
        results.append(result)
        return
    }

    let column = result.count

    for row in 0..<numberOfQueens {
        let leftDiagonally = "ld: \(column - row)"
        let rightDiagonally = "rd: \(column + row)"
        let columnLog = "c: \(column)"
        let rowLog = "r: \(row)"

        if !seen.contains(leftDiagonally)
           && !seen.contains(rightDiagonally)
           && !seen.contains(columnLog)
           && !seen.contains(rowLog) {
               // 可以被加進去
               seen.insert(leftDiagonally)
               seen.insert(rightDiagonally)
               seen.insert(columnLog)
               seen.insert(rowLog)
               result.append(row + 1)

               backtracking(&results, &result, &seen, numberOfQueens)

               result.removeLast()
               seen.remove(leftDiagonally)
               seen.remove(rightDiagonally)
               seen.remove(columnLog)
               seen.remove(rowLog)
        }
    }
}

```
