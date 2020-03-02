# isCryptSolution

## 20200302

### 1

``` swift
func isCryptSolution(crypt: [String], solution: [[Character]]) -> Bool {
    // 先把 solution 轉成 dictionary
    var solutions = [Character: Character]()
    for pair in solution {
        solutions[pair[0]] = pair[1]
    }

    // 開始解析
    var numbers = [Int]()
    for string in crypt {
        var result = ""
        for character in string {
            if let hit = solutions[character] {
                if result == "0" {
                    // 只要碰到有頭數是 0 的字串就直接回傳 false 不繼續檢查
                    return false
                }
                result.append(hit)
            }
        }
        // 轉型完再暫存
        numbers.append(Int(result)!)
    }

    return numbers[0] + numbers[1] == numbers[2]
}
```
