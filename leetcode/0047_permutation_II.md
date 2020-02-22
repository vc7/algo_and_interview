# 47. Permutation II

## 20200222

### 1

``` swift
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        var used = [Int: Bool]()
        var result = [Int]()
        
        generatePermutation(&results, &result, nums.sorted(), &used)
        
        return results
    }
    
    func generatePermutation(_ results: inout [[Int]], _ result: inout [Int], _ nums: [Int], _ used: inout [Int: Bool]) {
        if result.count == nums.count {
            results.append(result)
            return
        }
        
        for (index, num) in nums.enumerated() {
            // 跳過的條件
            // ① 有被用到的話就
            // ② index > 0 和 和前一個 index 的數字一樣 和 前一個相同值的 item 還沒有被用過
            if used[index] == true || index > 0 && nums[index - 1] == num && used[index - 1] == nil{
                continue
            }
            
            used[index] = true
            result.append(num)
            generatePermutation(&results, &result, nums, &used)
            result.removeLast()
            used[index] = nil
        }
    }
}
```
