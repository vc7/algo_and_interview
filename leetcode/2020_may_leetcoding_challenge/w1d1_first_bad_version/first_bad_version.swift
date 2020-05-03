import Foundation

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var head = 1 // 因為是從 1 開始，所以要注意不要從 0 開始
        var tail = n // 因為是到 n 為止，所以要注意上限不是 n - 1
        var middle = 0
        while head < tail {
            middle = head + (tail - head) / 2
            if isBadVersion(middle) {
                tail = middle
            } else {
                head = middle + 1
            }
        }
        return head
    }
}