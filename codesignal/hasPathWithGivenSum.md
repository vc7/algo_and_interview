# hasPathWithGivenSum

## 20200302

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
func hasPathWithGivenSum(t: Tree<Int>?, s: Int) -> Bool {
    guard let tree = t else { return false }
    return subRoutine(tree: tree, sum: s)
}

func subRoutine(tree: Tree<Int>?, sum: Int) -> Bool {
    var isMatched = false

    // if there don't have any rest leaves, check its owned value
    if tree?.left == nil && tree?.right == nil, let value = tree?.value {
        isMatched = isMatched || sum == value
    }

    //  if isMatched is already true, it is no need to check other sub trees 
    if !isMatched, let left = tree?.left, let value = tree?.value {
        isMatched = isMatched || subRoutine(tree: left, sum: sum - value)
    }

    //  if isMatched is already true, it is no need to check other sub trees
    if !isMatched, let right = tree?.right, let value = tree?.value {
        isMatched = isMatched || subRoutine(tree: right, sum: sum - value)
    }

    return isMatched
}
```
