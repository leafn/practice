import Foundation

func solution(_ n:Int) -> [Int] {
    var arr = [[Int]]()
    for i in 0..<n {
        arr.append([Int](repeating: 0, count: i + 1))
    }
    
    var it = 0
    var total = 0
    for i in 1...n {
        switch i % 3 {
        case 1:
            for j in 2 * it..<n - it {
                if it <= j {
                    total += 1
                    arr[j][it] = total
                }
            }
            break
        case 2:
            for j in 1 + it..<n - 2 * it {
                total += 1
                arr[n - 1 - it][j] = total
            }
            break
        case 0:
            for j in stride(from: n - it - 2, to: it * 2, by: -1) {
                total += 1
                arr[j][j - it] = total
            }
            it += 1
            break
        default:
            break
        }
    }

    return arr.flatMap { $0 }
}

solution(6)
