# 162. Find Peak Element

`Array` `Binary Search`

- <https://leetcode.com/problems/find-peak-element>

## 關鍵

有要求 `只要有出現 O(logn)` 這個條件，所以用 Binary Tree。

## 20200402

### 1

陣列長度：

- 如果長度是 1 的話，不會進 while 直接結束
- 長度是 2 的話，就會產生 `middle == 0` ，這時候意味著這個陣列最多只有兩個 items。

除此之外照著以下步驟走

① 從正中間開始找。如果正中間大於他的左或右的時候，直接回傳（提早結束）

② 前項不符合的時候

- 如果發現 middle - 1 的值 > middle ，就說明左半邊有找到的可能性，因此就直接尋找左半邊。更新右指標： `right = middle` 。
- 除此之外，也就是 middle + 1 > middle，就尋找右半邊。更新左指標: `left = middle + 1` 。

③ 直到最後為止，最後回傳 left 值。

``` swift
class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1

        while left < right {
            let middle = left + (right - left) / 2
            if middle == 0 {
                return (nums[left] > nums[right]) ? left : right
            }

            if nums[middle] > nums[middle-1] && nums[middle] > nums[middle+1] {
                return middle
            } else if nums[middle] < nums[middle-1] {
                right = middle
            } else {
                left = middle + 1
            }
        }
        return left
    }
}
```

#### Result

- <https://leetcode.com/submissions/detail/318524583/>

``` text
Runtime: 24 ms, faster than 96.60% of Swift online submissions for Find Peak Element.
Memory Usage: 20.9 MB, less than 100.00% of Swift online submissions for Find Peak Element.
```
