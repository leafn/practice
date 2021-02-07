import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var stack = [Int]()
    var result = 0
    var board = board.filter({ $0 != [0, 0, 0, 0, 0] })
    for move in moves {
        for (i, b) in board.enumerated() {
            let target = b[move - 1]
            if target != 0 {
                if stack.last ?? -1 == target {
                    _ = stack.removeLast()
                    result += 2
                }
                else { stack.append(target) }
                board[i][move - 1] = 0
                break
            }
        }
    }
    
    return result
}
