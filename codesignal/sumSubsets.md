# sumSubsets

## 20200224

### 1

``` swift
func sumSubsets(arr: [Int], num: Int) -> [[Int]] {
    if arr.isEmpty { return [[]] }

    var results: [[Int]] = []
    var result: [Int] = []
    var seen = Set<String>()
    var resultString = ""

    subroutine(&results, &result, &resultString, 0, num, arr, &seen)

    return results
}

func subroutine(_ results: inout [[Int]], _ result: inout [Int], _ resultString: inout String, _ start: Int, _ target: Int, _ array: [Int], _ seen: inout Set<String>) {
    // 成功條件 target 為 0
    if target == 0 {
        results.append(result)
        // if !seen.contains(resultString) {
        //     results.append(result)
        //     seen.insert(resultString)
        // }
        return
    }

    // 跑 loop
    for index in start..<array.count {
        let current = array[index]
        if result.isEmpty && index > 0 && current == array[index - 1] {
            continue
        }
        result.append(current)
        let currentString = ",\(current)"
        resultString.append(currentString)

        subroutine(&results, &result, &resultString, index + 1, target - current, array, &seen)
        result.removeLast()
        resultString.removeLast(currentString.count)
    }
}

/*

given
- sorted array


*/
```
