# Leetcode 區

## 題型註記

| 演算法 | 題號 |
|---|---|
| Backtracking | 39, 40, 43, 46, 47 <br> [climbingStaircase](https://github.com/vc7/algorithm_datas_tructure_leetcode/blob/master/codesignal/climbingStaircase.md), [nQueens](https://github.com/vc7/algorithm_datas_tructure_leetcode/blob/master/codesignal/nQueens.md) |
| Sliding Window | [findLongestSubarrayBySum](https://github.com/vc7/algorithm_datas_tructure_leetcode/blob/master/codesignal/findLongestSubarrayBySum.md)
| Dynamic Programming | [53](https://github.com/vc7/algorithm_datas_tructure_leetcode/blob/master/leetcode/0053_maximum_subarray.md)<br>[houseRobber](https://github.com/vc7/algorithm_datas_tructure_leetcode/blob/master/codesignal/houseRobber.md)(解法類似於 53)

| 資料結構 | 題號 |
|---|---|
| 二維陣列(Matrix) | 54<br>[rotateImage](https://github.com/vc7/algorithm_datas_tructure_leetcode/blob/master/codesignal/rotateImage.md), [sudoku2](https://github.com/vc7/algorithm_datas_tructure_leetcode/blob/master/codesignal/sudoku2.md) |
| Hashmap | [containsDuplicates](https://github.com/vc7/algorithm_datas_tructure_leetcode/blob/master/codesignal/containsDuplicates.md), [firstDuplicate](https://github.com/vc7/algorithm_datas_tructure_leetcode/blob/master/codesignal/firstDuplicate.md), [firstNotRepeatingCharacter](https://github.com/vc7/algorithm_datas_tructure_leetcode/blob/master/codesignal/firstNotRepeatingCharacter.md)
| 字串化 Hashmap | [nQueens](https://github.com/vc7/algorithm_datas_tructure_leetcode/blob/master/codesignal/nQueens.md), [sudoku2](https://github.com/vc7/algorithm_datas_tructure_leetcode/blob/master/codesignal/sudoku2.md)

## Binary Search 相關資料

### [Algorithm Patterns - Binary Search](https://www.youtube.com/watch?v=8T77iUOuXRA)

- 只要看到 `sorted in ascending order` 這樣的字眼就是可以用 binary search 的信號
- 如果在面試如果面試官沒有提，就可以問「這是有依序排列的嗎」
- 只要有出現 O(logn)
- 雖然有變形題目，在面試的時候還是就可以先把基礎的 binary search 寫出來再修改

## Sliding Window 相關資料

### [Sliding Window Approach | Longest Continuous Increasing Subsequence | LeetCode 674.](https://www.youtube.com/watch?v=jSvoE-_Yhs4)

- 674 是以 sliding window 來說是最基本的問題
- Sliding Window 可以拿來 longest sub-什麼鬼 這一類的問題

### [滑動視窗（Sliding Window）演算法介紹](https://www.jishuwen.com/d/2Epc/zh-tw)

#### 滑動視窗演算法總結

- 滑動視窗演算法可以用以解決陣列/字串的子元素問題
- 滑動視窗演算法可以將巢狀的for迴圈問題，轉換為單迴圈問題，降低時間複雜度

## Devide and Conquer

- 如果有需要重複做很多次的事情，可以考慮用這個方式讓重複的方式減少到一半，例如 [50. Pow(x, n)](https://leetcode.com/problems/powx-n/)
  - 時間複雜度也可以從 O(n) 降到 O(logn) → 對超大重複次數會非常有效果！

## Bit Shifting

- 當被要求做加減乘除不能用內建的 `+` `-` `*` `/` 就意味要用 bit shifting 解

## Fast Editing/Removal etc.

- Doubly Linked List
  - 搭配 hash table 的話，可以幫助 Doubly Linked List 快速定位並編輯或刪除節點

## Fast Lookup

- Hash Map / Hash Table
