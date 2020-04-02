# AtCode

## Swift 撰寫方法

他沒有給預設的方法，所以必須自行讀取。最單純的開始方法如下。

``` swift
import Foundation // 一定要！

// 從 readLine() 讀取，多行輸入就要改成用 array 裝
let array = readLine()!.componentsSeparatedByString(" ").map { Int($0)! }

// 結果用 print 印出來
print(array[0])
```
