# Backspace String Compare

- <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3291/>

## Follow Up

``` text
Can you solve it in O(N) time and O(1) space?
```

## Code - 1

資料結構演算法： `Stack`

先以最直觀的方式解解看。

``` swift
class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var stackS = [Character]()
        for character in S {
            if character == "#"  {
                if !stackS.isEmpty {
                    stackS.removeLast()
                }
            } else {
                stackS.append(character)
            }
        }

        var stackT = [Character]()
        for character in T {
            if character == "#" {
                if !stackT.isEmpty {
                    stackT.removeLast()
                }
            } else {
                stackT.append(character)
            }
        }

        return stackS == stackT
    }
}
```

### 複雜度分析 - 1

S 長度為 n, T 長度為 m

- 時間複雜度: O(max(m, n))
- 空間複雜度: O(m+n)

### Result - 1

- <https://leetcode.com/submissions/detail/322127062/>

## Code - 2

思考方式：既然視為 Stack ，那就從最後一個位置開始走。
對 Swift 來說是悲劇。

``` swift
class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var sPointer = S.count - 1
        var tPointer = T.count - 1

        var sCount = 0
        var tCount = 0

        while sPointer >= 0 || tPointer >= 0 {
            while sPointer >= 0 {
                if S[sPointer] == "#" {
                    sCount += 1
                    sPointer -= 1
                } else if sCount > 0 {
                    sCount -= 1
                    sPointer -= 1
                } else {
                    break
                }
            }

            while tPointer >= 0 {
                if T[tPointer] == "#" {
                    tCount += 1
                    tPointer -= 1
                } else if tCount > 0 {
                    tCount -= 1
                    tPointer -= 1
                } else {
                    break
                }
            }

            if sPointer >= 0 && tPointer >= 0 && S[sPointer] != T[tPointer] {
                return false
            }

            if (sPointer >= 0) != (tPointer >= 0) {
                return false
            }

            sPointer -= 1
            tPointer -= 1
        }

        return true
    }
}

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
```

### 複雜度分析 - 2

S 長度為 n, T 長度為 m

- 時間複雜度: O(m+n)
- 空間複雜度: O(1)

但是因為在 Swift 中「用 index 取字元」會產生很多額外成本 (overhead) ，所以在執行時間可以說是非常悲劇。

### Result - 2

- 悲劇 - <https://leetcode.com/submissions/detail/322147515/>

## Code - 3

``` swift
class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {

        var s = Array(S)
        var t = Array(T)

        var sPointer = S.count - 1
        var tPointer = T.count - 1

        var sCount = 0
        var tCount = 0

        while sPointer >= 0 || tPointer >= 0 {
            while sPointer >= 0 {
                if s[sPointer] == "#" {
                    sCount += 1
                    sPointer -= 1
                } else if sCount > 0 {
                    sCount -= 1
                    sPointer -= 1
                } else {
                    break
                }
            }

            while tPointer >= 0 {
                if t[tPointer] == "#" {
                    tCount += 1
                    tPointer -= 1
                } else if tCount > 0 {
                    tCount -= 1
                    tPointer -= 1
                } else {
                    break
                }
            }

            if sPointer >= 0 && tPointer >= 0 && s[sPointer] != t[tPointer] {
                return false
            }

            if (sPointer >= 0) != (tPointer >= 0) {
                return false
            }

            sPointer -= 1
            tPointer -= 1
        }

        return true
    }
}
```

### 複雜度分析 - 3

S 長度為 n, T 長度為 m

- 時間複雜度: O(m+n)
- 空間複雜度: O(m+n)

### Result - 3

先轉 character - <https://leetcode.com/submissions/detail/322148389/>