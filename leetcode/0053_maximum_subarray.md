# 53. Maximum Subarray

`Greedy` `Dynamic Programming`

- <https://www.youtube.com/watch?v=tinz1fiYv0c>

## 20200210

### 1

Dynamic Programming

``` swift
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count < 1 { return 0 }
        if nums.count == 1 { return nums[0] }
        var largest = nums[0]
        var sums = [nums[0]]

        for index in 1..<nums.count {
            sums.append(max(nums[index], sums[index-1] + nums[index]))
            largest = max(largest, sums[index])
        }
        return largest
    }
}
```

#### Result

``` text
Runtime: 40 ms, faster than 68.67% of Swift online submissions for Maximum Subarray.
Memory Usage: 21.2 MB, less than 16.67% of Swift online submissions for Maximum Subarray.
```

### 2

其實不需要把 sum 放進 array 裡面，只需要保存最後一個和即可

``` swift
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }

        var largest = nums[0]
        var previous = nums[0]

        for index in 1..<nums.count {
            let current = max(nums[index], previous + nums[index])
            largest = max(largest, current)
            previous = current
        }
        return largest
    }
}
```

#### Result

``` text
Runtime: 36 ms, faster than 93.08% of Swift online submissions for Maximum Subarray.
Memory Usage: 21 MB, less than 16.67% of Swift online submissions for Maximum Subarray.
```

### 3

用類 merge sort 解看看但是資源消耗超級多（？！）

謎

``` swift
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        return helper(nums, 0, nums.count - 1)
    }

    func helper(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
        if left == right { return nums[left] }

        let middle = left + (right - left) / 2

        let leftSum = helper(nums, left, middle)
        let rightSum = helper(nums, middle + 1, right)
        let mergedSum = mergeSums(nums, left, right, middle)

        return max(max(leftSum, rightSum), mergedSum)
    }

    func mergeSums(_ nums: [Int], _ left: Int, _ right: Int, _ middle: Int) -> Int {
        if left == right { return nums[left] }
        // Dealing the left half
        var leftSubsum = Int.min
        var currentSum = 0
        for index in (left...middle).reversed() {
            currentSum += nums[index]
            leftSubsum = max(leftSubsum, currentSum)
        }
        // Dealing the right half
        var rightSubsum = Int.min
        currentSum = 0
        for index in (middle+1)...right {
            currentSum += nums[index]
            rightSubsum = max(rightSubsum, currentSum)
        }
        return leftSubsum + rightSubsum
    }
}
```

#### Result

- <https://leetcode.com/submissions/detail/319144569/>

``` text
Runtime: 132 ms, faster than 5.19% of Swift online submissions for Maximum Subarray.
Memory Usage: 21.4 MB, less than 16.67% of Swift online submissions for Maximum Subarray.
```
