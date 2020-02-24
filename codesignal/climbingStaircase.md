# climbingStaircase

## 20200224

### 1

``` swift
func climbingStaircase(n: Int, k: Int) -> [[Int]] {
    if n == 0 || k == 0 { return [[]] }
    var results = [[Int]]()
    var result = [Int]()
    climb(&results, &result, n, k)
    return results
}

func climb(_ results: inout [[Int]], _ result: inout [Int], _ stairs: Int, _ jumpLimit: Int) {
    // 停止條件 ① - 剩餘的 stairs 為零，加入 results 並 return
    if stairs == 0 { 
        results.append(result)
        return
    }

    // 停止條件 ② - 剩餘的 stairs 小於零，就直接 return 
    if stairs < 0 {
        return
    }

    // 繼續深度走訪
    for jump in 1...jumpLimit {
        result.append(jump)
        climb(&results, &result, stairs - jump, jumpLimit)
        result.removeLast()
    }
}

/**

climb a staircase has n steps
jump stair at most k steps

sum of the steps should be n
most steps in side the result array should be k

*/
```
