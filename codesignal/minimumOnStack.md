# minimumOnStack

- <https://app.codesignal.com/challenge/LC8sv7t8uDEccgDYs>

## 20200302

### 1

``` swift
func minimumOnStack(operations: [String]) -> [Int] {
    var stack = [Int]()
    var storage = [Int]()
    var minimum = Int.max

    for raw in operations {
        if let operation = parse(raw) {
            switch operation {
                case .min:
                    stack.append(minimum)
                case .pop:
                    let last = storage.removeLast()
                    if last == minimum {
                        minimum = findMin(storage)
                    }
                case .push(let value):
                    storage.append(value)
                    minimum = min(minimum, value)
            }
        }
    }

    return stack
}

func parse(_ string: String) -> Operation? {
    var result: Operation?
    var stack = [String]()
    var current = ""
    for character in string {
        if character == " " {
            stack.append(current)
            current = ""
        } else {
            current.append(character)
        }
    }
    stack.append(current)

    if stack.count >= 1 {
        let command = stack[0]
        switch command {
            case "min": 
                result = .min
            case "pop": 
                result = .pop
            case "push":
                if let number = Int(current) {
                    result = .push(value: number)
                }
            default: break
        }
    }

    return result
}

func findMin(_ array: [Int]) -> Int {
    var minimum = Int.max
    for number in array {
        minimum = min(minimum, number)
    }
    return minimum
}

enum Operation {
    case push(value: Int)
    case pop
    case min
}
```
