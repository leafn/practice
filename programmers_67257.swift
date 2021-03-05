import Foundation

func solution(_ expression:String) -> Int64 {
    let expression = expression
        .replacingOccurrences(of: "+", with: " + ")
        .replacingOccurrences(of: "-", with: " - ")
        .replacingOccurrences(of: "*", with: " * ")
        .split(separator: " ")
    
    var m: Int64 = 0
    
    func permute(_ op: [String], expression: [String]) {
        guard op.count > 0 else {
            m = max(m, abs(Int64(expression.first!)!))
            return
        }
        op.enumerated().forEach {
            var expression = expression
            var op = op
            while true {
                if let idx = expression.firstIndex(of: $0.element) {
                    let before = expression.remove(at: idx - 1)
                    _ = expression.remove(at: idx - 1)
                    let after = expression.remove(at: idx - 1)
                    switch $0.element {
                    case "+": expression.insert(String(Int64(before)! + Int64(after)!), at: idx - 1)
                    case "-": expression.insert(String(Int64(before)! - Int64(after)!), at: idx - 1)
                    case "*": expression.insert(String(Int64(before)! * Int64(after)!), at: idx - 1)
                    default: break
                    }
                } else {
                    break
                }
            }
            _ = op.remove(at: $0.offset)
            permute(op, expression: expression)
        }
    }
    
    permute(["+", "-", "*"], expression: expression.map { String($0) })
    
    return m
}

solution("100-200*300-500+20") // 60420
solution("50*6-3*2") // 300
