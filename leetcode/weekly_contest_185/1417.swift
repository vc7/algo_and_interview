import Foundation

class Solution {
    func reformat(_ s: String) -> String {
        var a = [Character]()
        var b = [Character]()
        
        for character in s {
            if "0"..."9" ~= character {
                a.append(character)
            } else {
                b.append(character)
            }
        }
        
        swapIfNeeded(&a, &b)
        
        if a.count - b.count > 1 { return "" }
        
        var result = [Character]()
        
        for index in 0..<a.count {
            result.append(a[index])
            if index < b.count { result.append(b[index]) }
        }
        
        return String(result)
    }
    
    private func swapIfNeeded(_ a: inout [Character],
                              _ b: inout [Character]) {
        if a.count < b.count {
            let tmp = a
            a = b
            b = tmp
        }
    }
}