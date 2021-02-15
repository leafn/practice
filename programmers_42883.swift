import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var numbers = number.map { Int(String($0))! }
    var stack = [Int]()
    var k = k
    
    for (i, v) in numbers.enumerated() {
        guard stack.count > 0 else {
            stack.append(v)
            continue
        }
        
        while k > 0, stack.count > 0, stack.last! < v {
            _ = stack.popLast()
            k -= 1
        }
        stack.append(v)
    }
    if k > 0 {
        stack = Array(stack[0..<stack.count - k])
    }
    return stack.map { String($0) }.joined()
}

solution("1924", 2) // "94"
solution("1231234", 3) // "3234"
solution("4177252841", 4) // "775841"
