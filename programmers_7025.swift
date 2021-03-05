import Foundation

func solution(_ s:String) -> Int {
    var stack = [String.Element]()
    s.map { $0 }.forEach {
        if stack.count == 0 { stack.append($0) }
        else if stack.last! == $0 { stack.popLast() }
        else { stack.append($0) }
    }

    return stack.isEmpty ? 1 : 0
}
solution("baabaa") // 1
solution("cdcd") // 0
