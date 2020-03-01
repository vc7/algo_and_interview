# isTreeSymmetric

- <https://app.codesignal.com/interview-practice/task/tXN6wQsTknDT6bNrf/description>

## 20200301

### 1

``` swift
//
// Binary trees are already defined with this interface:
// public class Tree<T> {
//     public var value: T
//     public var left: Tree<T>?
//     public var right: Tree<T>?
//     public init(_ x: T) {
//         self.value = x
//         self.left = nil
//         self.right = nil
//     }
// }
func isTreeSymmetric(t: Tree<Int>?) -> Bool {
    return isMirror(tree1: t, tree2: t)
}

func isMirror(tree1: Tree<Int>?, tree2: Tree<Int>?) -> Bool {
    if tree1 == nil && tree2 == nil { return true }
    if tree1 == nil || tree2 == nil { return false }

    return tree1?.value == tree2?.value // 檢查值是否一樣
    && isMirror(tree1: tree1?.left, tree2: tree2?.right) // 檢查外側樹是否一樣
    && isMirror(tree1: tree1?.right, tree2: tree2?.left) // 檢查內側樹是否一樣
}
```

## 參考

- <https://www.youtube.com/watch?v=-5E5Jt_HKLc>
