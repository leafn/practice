import Foundation

func solution(_ n:Int) -> [Int] {
    var arr = [[Int]]()
    (0...n).forEach { arr.append([Int](repeating: 0, count: $0 + 1)) }
    
    var it = 0
    var total = 0
    
    (1...n).forEach {
        switch $0 % 3 {
        case 0:
            stride(from: n - it - 2, to: it * 2, by: -1).forEach {
                total += 1
                arr[$0][$0 - it] = total
            }
            it += 1
        case 1:
            (2 * it..<n - it).forEach {
                total += 1
                arr[$0][it] = total
            }
        case 2:
            (1 + it..<n - 2 * it).forEach {
                total += 1
                arr[n - 1 - it][$0] = total
            }
        default:
            break
        }
    }

    return arr.flatMap { $0 }
}

solution(6)