# possibleSums

- <https://app.codesignal.com/interview-practice/task/rMe9ypPJkXgk3MHhZ>

## 20200302

### 1

可能可以改善： memoization

``` swift
func possibleSums(coins: [Int], quantity: [Int]) -> Int {
    if coins.isEmpty { return 0 }
    if coins.count == 1 { return quantity[0] }

    var seen = Set<Int>()
    subRoutine(coins: coins, quantity: quantity, current: 0, index: 0, seen: &seen)
    return seen.count
}

func subRoutine(coins: [Int], quantity: [Int], current: Int, index: Int, seen: inout Set<Int>) {
    let coin = coins[index]
    let numberOfCoins = quantity[index]

    // 終止條件，抵達最後一個位置
    if index == coins.count - 1 {
        for count in 0...numberOfCoins {
            let newSum = current + coin * count
            if newSum > 0 {
                seen.insert(newSum)
            }
        }
        return
    }
    
    for count in 0...numberOfCoins {
        let newSum = current + coin * count
        subRoutine(coins: coins, quantity: quantity, current: newSum, index: index + 1, seen: &seen)
    }
}

/*

Given

- coins and its quantity.

Find how many distinct sums that will be.

排列組合？

    [0]   [1]   [2]
     10    50   100    
     0     0     0
     0     1     0
     0     2     0

     1     0     0  = 10
     1     1     0  = 60
     1     0     1  = 150
*/
```
