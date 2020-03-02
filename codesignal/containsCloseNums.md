# containsCloseNums

- <https://app.codesignal.com/interview-practice/task/njfXsvjRthFKmMwLC/description>

## 20200302

### 1

``` swift
func containsCloseNums(nums: [Int], k: Int) -> Bool {
    if nums.isEmpty { return false }

    // 1. recording there positions
    // 2. if the number has appear once, check the distance

    // key: number, value: is the index of appearance
    var positions = [Int: Int]()

    for index in 0..<nums.count {
        let number = nums[index]
        // Try to get the  previous appearance position
        if let previousAppearance = positions[number] {
            if index - previousAppearance <= k {
                return true
            }
        } 
        
        // 如果在 positions 裡面有出現過但是不符合要求的話，就覆寫
        // 沒有出現在 positions 裡面過的話，就記錄下來
        positions[number] = index
    }

    return false
}

/*

(note)

given
- an integer array
- integer k

Is exist

i and j will not be the same
nums[i] = nums[j]
j - i <= k

*/
```
