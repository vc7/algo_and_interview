# houseRobber

Dynamic Programming, DP

- https://app.codesignal.com/interview-practice/task/XBWN6DYRqPrKdMZs8/description

類似題型

- https://www.youtube.com/watch?v=tinz1fiYv0c

### 思考方式

- 因為不能和自己相鄰的數值加總，因此在加總的時候都是去加隔一個位置的值
  - `自己` + `自己兩個位置前的最大結果` 和目前的 `最大值` 誰最大
  - `自己兩個位置前的最大結果` - 應該可以說是 devide and conquer ?

Given Array:

| [0] | [1] | [2] | [3] |
|-----|-----|-----|-----|
|  1  |  0  |  0  |  7  |

以這個陣列為例

| Step | Index | Result | Description |
|:---:|:---:|:---:|---|
| 1 | 0 | 1 | 因為只有一個值所以想當然是 [0] 的 1
| 2 | 1 | 1 | 這時候只有兩個，所以 max([0]的值, [1]的值) 就是 1
| 3 | 2 | 1 | `自己` (0) + `自己兩個位置前([0])的最大結果` (1) = 1, max 比較後的結果則是 1
| 4 | 3 | 8 | `自己` (7) + `自己兩個位置前([1])的最大結果` (1) = 8, max 比較後的結果則是 8


## 20200224

### 1

``` swift
func houseRobber(nums: [Int]) -> Int {
    var previous = 0
    var maximum = 0

    for number in nums {
        let temp = max(previous + number, maximum)
        previous = maximum
        maximum = temp
    }

    return maximum
}
```
