import Foundation

var arr = [[Int]](repeating: [Int](), count: 8)

func BFS(_ start: Int) {
    var queue = [Int]()
    var visited = [Bool](repeating: false, count: arr.count)
    
    queue.append(start)
    visited[start] = true
    while !queue.isEmpty {
        let element = queue.removeFirst()
        print(element)
        
        for value in arr[element] {
            if visited[value] == false {
                queue.append(value)
                visited[value] = true
            }
        }
    }
}

var visited = [Bool](repeating: false, count: arr.count)

func DFS(_ start: Int) {
    guard visited[start] == false else { return }
    visited[start] = true
    print(start)
    for value in arr[start] {
        DFS(value)
    }
}

arr[1].append(2)
arr[2].append(1)

arr[1].append(3)
arr[3].append(1)

arr[2].append(3)
arr[3].append(2)

arr[2].append(4)
arr[4].append(2)

arr[2].append(5)
arr[5].append(2)

arr[3].append(6)
arr[6].append(3)

arr[3].append(7)
arr[7].append(3)

arr[4].append(5)
arr[5].append(4)

arr[6].append(7)
arr[7].append(6)

BFS(1)
DFS(1)
