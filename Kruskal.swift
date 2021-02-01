import Foundation

var arr = [Int]()

func parent(_ a: Int) -> Int {
    if arr[a] == a { return a }
    arr[a] = parent(arr[a])
    return arr[a]
}

func union(_ a: Int, _ b: Int) {
    let a = parent(a)
    let b = parent(b)
    if a < b { arr[b] = a }
    else { arr[a] = b }
}

func find(_ a: Int, _ b: Int) -> Bool {
    let a = parent(a)
    let b = parent(b)
    if a == b { return true }
    else { return false }
}

struct Edge: Comparable {
    var a, b, distance: Int
    
    init(a: Int, b: Int, distance: Int) {
        self.a = a - 1
        self.b = b - 1
        self.distance = distance
    }
    
    static func < (lhs: Edge, rhs: Edge) -> Bool { lhs.distance < rhs.distance }
}

var v = [Edge]()
v.append(Edge(a: 1, b: 7, distance: 12))
v.append(Edge(a: 1, b: 4, distance: 28))
v.append(Edge(a: 1, b: 4, distance: 67))
v.append(Edge(a: 1, b: 5, distance: 17))
v.append(Edge(a: 2, b: 4, distance: 24))
v.append(Edge(a: 2, b: 5, distance: 62))
v.append(Edge(a: 3, b: 5, distance: 20))
v.append(Edge(a: 3, b: 6, distance: 37))
v.append(Edge(a: 4, b: 7, distance: 13))
v.append(Edge(a: 5, b: 6, distance: 45))
v.append(Edge(a: 5, b: 7, distance: 73))

v = v.sorted(by: <)

arr = [Int](0..<v.count)

var sum = 0
for (idx, val) in v.enumerated() {
    if !find(val.a, val.b) {
        sum += val.distance
        union(val.a, val.b)
    }
}

print(sum)
