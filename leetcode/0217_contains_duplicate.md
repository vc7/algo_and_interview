# 217. Contains Duplicate

- <https://leetcode.com/problems/contains-duplicate/>
- 自己發的文章 <https://leetcode.com/problems/contains-duplicate/discuss/579551/Swift-short-explaination>

這題直覺上就可以想到很多解法。

1. 用 dictionary 作為 hash table 
2. 用 set 作為 hash table 
3. 先排序，從 index 1 開始走訪，如果跟前一個一樣的話就回傳 true

雖然第三個解法，應該算是很直覺最先想到的，但是因為要先排序就明顯會是最慢的，所以我最後才把它寫出來看看。

## 20200415

### 1. 用 dictionary 作為 hash table

``` swift
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        if nums.count <= 1 { return false }
        var hashTable = [Int:Bool]()
        
        for number in nums {
            if hashTable[number] != nil {
                return true
            } else {
                hashTable[number] = true
            }
        }
        return false
    }
}
```

#### 結果

- <https://leetcode.com/submissions/detail/324747995/>

``` swift
Runtime: 156 ms (beats 71.13%)
Memory Usage: 22.3 MB
```

### 2. 用 Set 作為 hash table (1 的演化)

``` swift
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        if nums.count <= 1 { return false }
        
        var hashTable = Set<Int>()
        
        for number in nums {
            if hashTable.contains(number) {
                return true
            } else {
                hashTable.insert(number)
            }
        }
        
        return false
    }
}
```

#### 結果

- <https://leetcode.com/submissions/detail/324747995/>

``` swift
Runtime: 160 ms (beats 45.36%)
Memory Usage: 22.2 MB
```

### 3.  最佳化究極版 Set

最大的優點：因為沒有逐步做 insert 這樣偏重的運算。

``` swift
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count == nums.count
    }
}
```

#### 結果

- <https://leetcode.com/submissions/detail/324752415/>

``` swift
Runtime: 144 ms (beats 98.97%)
Memory Usage: 21.5 MB
```
