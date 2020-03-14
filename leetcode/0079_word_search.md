# 79. Word Search

- <https://leetcode.com/problems/word-search/>

## 20200314

### 1

``` swift
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        let rowCount = board.count
        let columnCount = board[0].count
        var count = (row: rowCount, column: columnCount)
        
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: columnCount), count: rowCount)
        let characters = Array(word)
        
        for row in 0..<board.count {
            for column in 0..<board[0].count {
                if findExist(board: board, visited: &visited, word: characters, row: row, column: column, index: 0, count: &count) {
                    return true
                }
            }
        }
        
        return false
    }
    
    func findExist(board: [[Character]], visited: inout [[Bool]], word: [Character], row: Int, column: Int, index: Int, count: inout (row: Int, column: Int)) -> Bool {
        if index >= word.count { return true }
        
        if row >= count.row || row < 0 || column >= count.column || column < 0 || board[row][column] != word[index] || visited[row][column] {
            return false
        }
        
        visited[row][column] = true
        
        if findExist(board: board, visited: &visited, word: word, row: row + 1, column: column, index: index + 1, count: &count) ||
           findExist(board: board, visited: &visited, word: word, row: row - 1, column: column, index: index + 1, count: &count) ||
           findExist(board: board, visited: &visited, word: word, row: row, column: column - 1, index: index + 1, count: &count) ||
           findExist(board: board, visited: &visited, word: word, row: row, column: column + 1, index: index + 1, count: &count) {
                return true
        }
        
        visited[row][column] = false
        
        return false
    }
}
```

#### Result

``` text
Runtime: 304 ms, faster than 87.84% of Swift online submissions for Word Search.
Memory Usage: 21.9 MB, less than 66.67% of Swift online submissions for Word Search.
```
