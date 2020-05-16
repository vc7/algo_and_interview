# 5 月 LeetCode 挑戰, W2D7, Implement Trie (Prefix Tree) (Trie), in Swift

資料結構與演算法： `Trie`

- 挑戰頁面 - [Implement Trie (Prefix Tree)](https://leetcode.com/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3329/)
- 原題目頁面 - [208. Implement Trie (Prefix Tree)](implement-trie-prefix-tree)

## 思考方式

這一題就是要我們實作一的字典樹，和其中幾個查找的功能。

### 字典樹



## 程式碼

``` swift
class Node {
    /// 子節點的 dictionary
    var children = [Character: Node]()
    /// 半段是否有到這個節點為止的單字
    var isWord = false
}

class Trie {
    // 直接在這邊初始化 root node
    var root = Node()

    init() { }

    func insert(_ word: String) {
        var node = root
        for character in word {
            if let current = node.children[character] {
                node = current
            } else {
                let current = Node()
                node.children[character] = current
                node = current
            }
        }
        node.isWord = true
    }

    func search(_ word: String) -> Bool {
        var node = root
        for character in word {
            if let current = node.children[character] {
                node = current
            } else {
                return false
            }
        }
        return node.isWord
    }

    func startsWith(_ prefix: String) -> Bool {
        var node = root
        for character in prefix {
            if let current = node.children[character] {
                node = current
            } else {
                return false
            }
        }
        return true
    }
}
```

- <https://leetcode.com/submissions/detail/339306401/?from=/explore/challenge/card/may-leetcoding-challenge/535/week-2-may-8th-may-14th/3329/>
