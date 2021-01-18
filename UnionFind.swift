import Foundation

var arr = [Int](0...10)

func getParent(_ a: Int) -> Int {
    if arr[a] == a { return a }
    arr[a] = getParent(arr[a])
    return arr[a]
}

func union(_ a: Int, _ b: Int) {
    let a = getParent(a)
    let b = getParent(b)
    if a < b { arr[b] = a }
    else { arr[a] = b }
}

func find(_ a: Int, _ b: Int) -> Bool {
    let a = getParent(a)
    let b = getParent(b)
    if (a == b) { return true }
    else { return false }
}

union(1, 2)
union(2, 3)
union(3, 4)
union(5, 6)
union(6, 7)
union(7, 8)
print(find(1, 5))
union(1, 5)
print(find(1, 5))
