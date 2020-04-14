# Perform String Shifts

資料結構或演算法： `String` `Math`

- 挑戰頁面 - <https://leetcode.com/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3299/>

這一題好像是新的，還沒有原先題目頁面。

## 思維

這題應該算是數學歸納的問題，步驟說明、演算法有更好解或是複雜度分析有問題的話都請留言告訴我。

### 步驟

- 算出最終移動的方向（概念和前一天的題目相同，題目筆記之後再補）
  - 往左就 -1 ，往右就 +1
- 總部數是 0 就直接回傳
- 因為移動超過字串長度後就會開始循環做同樣的事情，於是除以字串長度取得餘數
- 根據分析會發現 (往左 + 字串長度) 會和 往右 會有同樣的效果，因此如果是負值的話將它加上字串長度
- 接著一個一個把最後一個字元往前移動到前面
- 生成字串物件回傳

## 程式碼

``` swift
class Solution {
    func stringShift(_ s: String, _ shift: [[Int]]) -> String {
        if s.count <= 1 { return s }
        
        var moves = 0
        
        // 取得算出所有移動後的最終步數
        for pair in shift {
            var direction = pair[0]
            var steps = pair[1]
            switch direction {
                case 0: moves -= steps
                case 1: moves += steps
                default: break
            }
        }
        
        // 為零就直接回傳
        if moves == 0 { return s }

        // 必要之惡
        var characters = Array(s)
        var length = characters.count

        // 把步數正規化到 -length + 1 到 length - 1 之間
        moves %= length
        
        // 若步數為負值，把它轉換成相對應的正值
        if moves < 0 {
            moves += length
        }

        // 移動...移動...移動...
        while moves > 0 && moves <= length {
            characters.insert(characters.removeLast(), at: 0)
            moves -= 1
        }
        
        return String(characters)
    }
}
```

### 高階函數

如果熱愛高階函數的話，可以把算出最終步數的地方改成這樣

``` swift
var moves = shift.reduce(0) { $0 + ($1[0] == 0 ? -1 : 1 ) * $1[1] }
```

想要把程式碼整體變短還有更激進的做法，不過會大大降低程式碼的可讀性在這邊就不繼續做了。

## 複雜度分析

- 時間複雜度： O(max(s.length, shift.length))
- 空間複雜度： O(s.length)
  - 轉成 characters 應該是必要之惡（翻白眼）

## 結果

- <https://leetcode.com/submissions/detail/324703116/>

寫的時候樣本數不足因此無法知道在幾趴的地方

``` text
Runtime: 8 ms
Memory Usage: 21.6 MB
```

改成高階函數的運行結果如下（是壞掉了？）

- <https://leetcode.com/submissions/detail/324713010/?from=/explore/challenge/card/30-day-leetcoding-challenge/529/week-2/3299/>

``` text
Memory Usage: 21824000
```