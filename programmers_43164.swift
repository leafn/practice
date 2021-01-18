import Foundation

var arr: [Int] = [Int]()

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

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    arr = [Int](0..<n)
    for (i_0, v_0) in computers.enumerated() {
        for (i_1, v_1) in v_0.enumerated() {
            if i_0 == i_1 { continue }
            else {
                if v_1 == 1 { union(i_0, i_1) }
            }
        }
    }
    
    return Array(Set(arr.map { parent($0) })).count
}

solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]])
solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]])
solution(6, [[1, 0, 1, 1, 0, 0], [0, 1, 0, 0, 1, 1], [1, 0, 1, 1, 1, 1], [1, 0, 1, 1, 1, 1], [0, 1, 1, 1, 1, 1], [0, 1, 1, 1, 1, 1]])
solution(3, [[1, 0, 0], [0, 1, 0], [0, 0, 1]])
solution(4, [[1, 0, 0, 1], [0, 1, 1, 0], [0, 1, 1, 0], [1, 1, 0, 1]])
