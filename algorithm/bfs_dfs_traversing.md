# 廣度優先搜尋與深度優先搜尋

Searching relationships, not just graphs. For example string distance, tree, ets.

| | 廣度優先搜尋 | 深度優先搜尋 |
|:---:|:---:|:---:|
| **全稱** | Breadth First Search | Depth First Search |
| **簡稱**| BFS | DFS |
| **暫存的資料結構**| Queue | Stack |
| **資料結構的資料存取方式**| LIFO | FIFO |
| **方向**| Go **WIDE** | Go **DEEP** |

### 複雜度

O(v+e)

- **v** - 節點數
- **e** - 邊數

### 註記

- 搜尋對象是樹或是 graph ，詳細比較時的實作會不太一樣
- 搜尋的節點 (node) 或是點 (vertex) ，要有個絕對識別 (primary key, id etc.) 會比較好比較

## 實作

### BFS

``` swift
func breadthFirstSearchTraversing(startVertex: Vertex<String>) -> String {
    var queue = [Vertex<String>]()
    var seenVertices = [Vertex<String>]()
    var resultString = ""
    
    queue.append(startVertex)
    printQueue(queue, "Initialized")
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        printQueue(queue, "polled")
        if !seenVertices.contains(where: { $0.value == current.value }) {
            seenVertices.append(current)
            resultString.append(current.value)
            print("Current: \(resultString)")
        }
        
        for edge in current.neiborEdges {
            if edge.origin.value == current.value && !seenVertices.contains(where: { $0.value == edge.neibor.value }) {
                queue.append(edge.neibor)
            }
        }
        
        printQueue(queue, "pushed")
    }
    
    return resultString
}
```

``` swift
func printQueue(_ stack: [Vertex<String>], _ message: String) {
    print("       +----------")
    print("Queue  | \(stack.map { $0.value }.joined())")
    print("       +----------")
}
```

#### 呼叫

``` swift
let result = breadthFirstSearchTraversing(startVertex: vertexA)
print("Result: \(result)")
```

### DFS

``` swift
func depthFirstSearchTraversing(startVertex: Vertex<String>) -> String {
    var stack = [Vertex<String>]()
    var seenVertices = [Vertex<String>]()
    var resultString = ""
    
    stack.append(startVertex)
    printStack(stack, "Initialized")
    
    while let current = stack.popLast() {
        printStack(stack, "poped")
        if !seenVertices.contains(where: { $0.value == current.value }) {
            seenVertices.append(current)
            resultString.append(current.value)
            print("Current: \(resultString)")
        }
        for edge in current.neiborEdges {
            if edge.origin.value == current.value && !seenVertices.contains(where: { $0.value == edge.neibor.value }) {
                stack.append(edge.neibor)
            }
        }

        printStack(stack, "pushed")
    }
    
    return resultString
}
```


``` swift
func printStack(_ stack: [Vertex<String>], _ message: String) {
    print("       +----------")
    print("Stack  | \(stack.map { $0.value }.joined())")
    print("       +----------")
}
```

#### 呼叫

``` swift
let result = depthFirstSearchTraversing(startVertex: vertexA)
print("Result: \(result)")
```

### Graph 資料結構

``` swift
class Vertex<T> {
    let value: T
    var neiborEdges: [Edge<T>] = []
    init(_ value: T) {
        self.value = value
    }
}

class Edge<T> {
    let origin: Vertex<T>
    let neibor: Vertex<T>
    
    init(from: Vertex<T>, to: Vertex<T>) {
        self.origin = from
        self.neibor = to
    }
}

class Graph<T> {
    var vertices: [Vertex<T>] = []
    var edges: [Edge<T>] = []
    
    func addVertex(_ vertex: Vertex<T>) {
        vertices.append(vertex)
    }
    
    func addEdge(from: Vertex<T>, to: Vertex<T>) {
        // 無方向性所以雙向都加
        let edge = Edge(from: from, to: to)
        from.neiborEdges.append(edge)
        edges.append(edge)
        
        let reversedEdge = Edge(from: to, to: from)
        to.neiborEdges.append(reversedEdge)
        edges.append(reversedEdge)
    }
}
```

#### 資料

無方向性，無加權 Graph

``` swift
let graph = Graph<String>()

let vertexA = Vertex("a")
let vertexB = Vertex("b")
let vertexC = Vertex("c")
let vertexD = Vertex("d")
let vertexE = Vertex("e")
let vertexF = Vertex("f")
let vertexG = Vertex("g")
let vertexH = Vertex("h")

graph.addVertex(vertexA)
graph.addVertex(vertexB)
graph.addVertex(vertexC)
graph.addVertex(vertexD)
graph.addVertex(vertexE)
graph.addVertex(vertexF)
graph.addVertex(vertexG)
graph.addVertex(vertexH)

graph.addEdge(from: vertexA, to: vertexB)
graph.addEdge(from: vertexA, to: vertexC)
graph.addEdge(from: vertexA, to: vertexD)
graph.addEdge(from: vertexA, to: vertexE)
graph.addEdge(from: vertexB, to: vertexC)
graph.addEdge(from: vertexB, to: vertexG)
graph.addEdge(from: vertexC, to: vertexD)
graph.addEdge(from: vertexD, to: vertexH)
graph.addEdge(from: vertexE, to: vertexF)
graph.addEdge(from: vertexF, to: vertexG)
graph.addEdge(from: vertexF, to: vertexH)
```
