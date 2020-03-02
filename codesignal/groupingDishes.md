# groupingDishes

- <https://app.codesignal.com/interview-practice/task/xrFgR63cw7Nch4vXo/description>

## 20200302

### 1

``` swift
func groupingDishes(dishes: [[String]]) -> [[String]] {
    if dishes.isEmpty { return [] }
    var ingredients = [String: [String]]()

    for dish in dishes {
        let dishName = dish[0]
        for index in 1..<dish.count {
            let ingredient = dish[index]
            var dishNames = ingredients[ingredient] ?? [String]()
            dishNames.append(dishName)
            ingredients[ingredient] = dishNames
        }
    }

    var results = [[String]]()

    for (ingredient, dishes) in ingredients {
        if dishes.count >= 2 {
            let result = [ingredient] + dishes.sorted()
            results.append(result)
        }
    }

    return results.sorted { $0[0] < $1[0] }
}
```
