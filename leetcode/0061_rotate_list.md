# 61. Rotate List

- https://leetcode.com/problems/rotate-list/

## 20200229

### 1

``` swift
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil { return nil }
        var count = 0
        
        let dummy: ListNode? = ListNode(0)
        var fastNode = dummy
        var slowNode = dummy
        
        // 用 dummy 節點保留 head 的參照
        dummy?.next = head
        
        // 計算總共有幾個節點
        while fastNode?.next != nil {
            count += 1
            fastNode = fastNode?.next
        }
        
        // 計算實際上需要移動幾個位置即可
        let top = count - k % count
        for index in (0..<top).reversed() {
            slowNode = slowNode?.next
        }
        
        // 接合
        // 1. 把原先的頭街上快節點的下一個位置
        // 2. 把 dummy 節點的下一個位置接上慢節點
        // 3. 把慢節點的下一個位置設為 nil ，解開原先的鏈結
        fastNode?.next = dummy?.next
        dummy?.next = slowNode?.next
        slowNode?.next = nil
        
        return dummy?.next
    }
}
```

#### Result

``` text
Runtime: 16 ms, faster than 73.47% of Swift online submissions for Rotate List.
Memory Usage: 20.8 MB, less than 100.00% of Swift online submissions for Rotate List.
```
