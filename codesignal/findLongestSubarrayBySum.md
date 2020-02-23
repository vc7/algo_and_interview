# findLongestSubarrayBySum

https://app.codesignal.com/interview-practice/task/izLStwkDr5sMS9CEm/description

## 20200223

### 1

Using sliding window

``` swift
func findLongestSubarrayBySum(s: Int, arr: [Int]) -> [Int] {
    var result = [-1]
    
    var sum = 0
    var left = 0
    var right = 0

    while right < arr.count {
        sum += arr[right]
        while left < right && sum > s {
            sum -= arr[left]
            left += 1
        }
        if sum == s && (result.count == 1 || result[1] - result[0] < right - left) {
            result = [left + 1, right + 1]
        }
        right += 1
    }

    return result
}
```
