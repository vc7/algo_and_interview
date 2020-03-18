# 287. Find the Duplicate Number

- <https://leetcode.com/problems/find-the-duplicate-number/>

### 簡要解說

- Floyd Cycle / Tortoise and Hare Algorithm 的應用
- 每一個元素內容的值介於 1 到 count - 1 之間
- 每一個元素的值則可以理解成下一步可以移動到的位置

### 例如

``` text
+-----+-----+-----+-----+-----+
| [0] | [1] | [2] | [3] | [4] |
+-----+-----+-----+-----+-----+
|  1  |  3  |  4  |  2  |  3  |
+-----+-----+-----+-----+-----+
```

視為狀態機圖形化後可以表示成這樣

``` text

+---+    +---+    +---+    +---+
| 1 | -> | 3 | -> | 2 | -> | 4 |
+---+    +---+    +---+    +---+
           ^                 |
           |                 |
           +-----------------+
```


## 20200318

### 1

``` swift
class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        let intersectionIndex = findIntersectionIndex(nums)
        return findStartIndex(nums, intersectionIndex)
    }
    
    /// 找出交叉的位置
    func findIntersectionIndex(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[0]
        
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast
        
        return slow
    }
    
    /// 找出環狀的起始點
    func findStartIndex(_ nums: [Int], _ intersection: Int) -> Int {
        var slow = nums[0]
        var fast = intersection
        
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }
        
        return slow
    }
}
```

龜兔賽跑的部分：

- `nums[slow]` 是走一步
- `nums[nums[fast]]` 是走兩步

``` swift
slow = nums[slow]
fast = nums[nums[fast]]
```

### Result

``` text
Runtime: 48 ms, faster than 98.41% of Swift online submissions for Find the Duplicate Number.
Memory Usage: 21.2 MB, less than 100.00% of Swift online submissions for Find the Duplicate Number.
```
