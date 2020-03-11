# 71. Simplify Path

- <https://leetcode.com/problems/simplify-path/submissions/>

## 20200311

### 1

``` swift
class Solution {
    func simplifyPath(_ path: String) -> String {
        if path.isEmpty { return "/" }
        var commands = path.components(separatedBy: "/")
        var commandStack = [String]()
        
        for command in commands {
            if !command.isEmpty {
                if command == ".." {
                    if !commandStack.isEmpty {
                        commandStack.removeLast()
                    }
                } else if command != "." {
                    commandStack.append(command)
                }
            }
        }
        
        return commandStack.isEmpty ? "/" : "/" + commandStack.joined(separator: "/")
    }
}
```

#### Result

``` text
Runtime: 40 ms, faster than 43.75% of Swift online submissions for Simplify Path.
Memory Usage: 21.9 MB, less than 100.00% of Swift online submissions for Simplify Path.
```
