# Jump Game

`Greedy`

用 greedy 的方式。迴圈只會嘗試到 latest (reachable) position 為止。在每個迴圈中會根據當前的位置更新 latest position 。

``` cpp
// https://leetcode.com/submissions/detail/330287170/?from=/explore/challenge/card/30-day-leetcoding-challenge/531/week-4/3310/
class Solution {
public:
    bool canJump(vector<int>& nums) {
        int size = nums.size();
        int latest = 0;
        int index = 0;
        
        while (index <= latest  && latest < size) {
            latest = std::max(latest, nums[index] + index);
            ++index;
        }
        
        return latest >= size-1;
    }
};
```

``` swift
// https://leetcode.com/submissions/detail/330290370/?from=/explore/challenge/card/30-day-leetcoding-challenge/531/week-4/3310/
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var latest = 0
        var index = 0
        
        while index <= latest && latest < nums.count {
            // 更新可以走到的位置
            latest = max(latest, nums[index] + index)
            index += 1
        }
        
        return latest >= nums.count - 1
    }
}
```

## Test Data

``` text
[2,3,1,1,4]
[3,2,1,0,4]
[0,1,2]
```