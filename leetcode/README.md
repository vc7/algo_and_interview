# Leetcode 區

## 題型註記

| 演算法 | 題號或題名 |
|---|---|
| Binary Search | [33](0033_search_in_rotated_sorted_array.md), [69](0069_sqrt_x.md), [81](0081.md), [153](0153_find_minimum_in_rotated_sorted_array.md), [162](0162_find_peak_element.md)
| Backtracking | 39, 40, 43, 46, 47, [77](0077_combinations.md), [78](0078_subsets.md), [79](0079_word_search.md), [90](0090_subsets_II.md)<br> [climbingStaircase](../codesignal/climbingStaircase.md), [nQueens](../codesignal/nQueens.md), [hasPathWithGivenSum](../codesignal/hasPathWithGivenSum.md), [isTreeSymmetric](../codesignal/isTreeSymmetric.md), [possibleSums](../codesignal/possibleSums.md) |
| Sliding Window | [findLongestSubarrayBySum](../codesignal/findLongestSubarrayBySum.md)
| Dynamic Programming | [53](0053_maximum_subarray.md), [62](0062_unique_paths.md), [63](0063_unique_paths_II.md), [64](0064_minumum_path_sum.md), [70](0070_climbing_stairs.md), [91](0091.md), [121](0121_best_time_to_buy_and_sell_stock.md)<br>[houseRobber](../codesignal/houseRobber.md)(解法類似於 53)
| Two Pointers | [75](0075_sort_colors.md), [283](0283_move_zeroes.md)
| Two Pointers (Slow-Fast) | [19](https://github.com/vc7/algorithm_datas_tructure_leetcode/blob/b7ac153c5d5e5ab894d86b7d9c66a87917de7dae/leetcode/0019_remove_nth_node_from_end_of_list.md), [61](0061_rotate_list.md), [287](0287_find_the_dulicate_number.md)<br>[removeKFromList](../codesignal/removeKFromList.md), [isListPalindrome](../codesignal/isListPalindrome.md)
| Greedy | [64](0064_minumum_path_sum.md), [121](0121_best_time_to_buy_and_sell_stock.md), [122](0122_best_time_to_buy_and_sell_stock_II.md)
| BFS | [103](0103_binary_tree_zigzag_level_order_traversal.md)

| 資料結構 | 題號或題名 |
|---|---|
| Array | [56](0056_merge_intervals.md)(+Sort), [78](0078_subsets.md), [90](0090_subsets_II.md), [121](0121_best_time_to_buy_and_sell_stock.md), [122](0122_best_time_to_buy_and_sell_stock_II.md), [67](0067_add_binary.md), [136](0136.md)(XOR, `^=`), [162](0162_find_peak_element.md), [283](0283_move_zeroes.md), [287](0287_find_the_dulicate_number.md)<br>[isCryptSolution](../codesignal/isCryptSolution.md)
| Stack | [71](0071_simplify_path.md)
| 二維陣列(Matrix) | [54](0054_spiral_matrix.md), [59](0059_spiral_matrix_II.md), [73](0073_set_matrix_zeroes.md), [74](0074_search_a_2d_matrix.md), [628](0628_maximum_product_of_three_numbers.md)<br>[rotateImage](../codesignal/rotateImage.md), [sudoku2](../codesignal/sudoku2.md) |
| Singly-linked List | [83](0083.md), [86](0086.md)<br>[removeKFromList](../codesignal/removeKFromList.md), [isListPalindrome](../codesignal/isListPalindrome.md)(反轉), [addTwoHugeNumbers](../codesignal/addTwoHugeNumbers.md)(反轉), [mergeTwoLinkedLists](../codesignal/mergeTwoLinkedLists.md)
| Hashmap | [73](0073_set_matrix_zeroes.md), [383](0383_ransom_note.md)<br>[containsDuplicates](../codesignal/containsDuplicates.md), [firstDuplicate](../codesignal/firstDuplicate.md), [firstNotRepeatingCharacter](../codesignal/firstNotRepeatingCharacter.md), [areFollowingPatterns](../codesignal/areFollowingPatterns.md), [containsCloseNums](../codesignal/containsCloseNums.md), [possibleSums](../codesignal/possibleSums.md)
| 字串化 Hashmap | [nQueens](../codesignal/nQueens.md), [sudoku2](../codesignal/sudoku2.md)
| Tree | [100](0100.md)<br>[hasPathWithGivenSum](../codesignal/hasPathWithGivenSum.md), [isTreeSymmetric](../codesignal/isTreeSymmetric.md)
| String | [58](0058_length_of_last_word.md), [71](0071_simplify_path.md)<br>[minimumOnStack](../codesignal/minimumOnStack.md)

| 題型 | 題號或題名 |
|---|---|
| Rotated Array | [33](0033_search_in_rotated_sorted_array.md), [81](0081.md), [152](0152_maximum_product_subarray.md), [153](0153_find_minimum_in_rotated_sorted_array.md)
| 排列組合 | [77](0077_combinations.md), [78](0078_subsets.md), [90](0090_subsets_II.md)<br>[possibleSums](../codesignal/possibleSums.md)
| Path | [62](0062_unique_paths.md), [63](0063_unique_paths_II.md), [64](0064_minumum_path_sum.md)
| Math (乘法) |  [152](0152_maximum_product_subarray.md), [628](0628_maximum_product_of_three_numbers.md)

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

## Backtracking or Dynamic Programming

- 如果需要 **計算** 所有項目出來的話就是要用 Dynamic Programming (+ memoization)
  - 好的情況時可以把指數型的時間複雜度降到線性的時間複雜度
- 如果需要 **列舉** 所有項目出來的話就是要用 Backtracking

## 排列組合

- 需要列舉的話，用 backtracking
- 如果需要把有 n 個元素的陣列， 0~n 個元素的排列組合全部列出來的話
  - 邊 backtracking 走訪每一個階段邊儲存結果
  - 停止條件為 start index 到達 n
  
## Rotated Sorted Array

- Binary Search!!

### 基本算法： 找原始開頭

``` swift
var left = 0
var right = nums.count - 1

while left < right {
    let middle = left + (right - left) / 2
    if nums[middle] > nums[right] {
        left = middle + 1
    } else {
        right = middle
    }
}
```

走完 while 迴圈， left 的最後值就是開頭
