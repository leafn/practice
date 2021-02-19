import Foundation

func solution(_ s:String) -> Bool
{
    let s = s.map { String($0) }
    var l_count = 0
    for c in s {
        if c == "(" { l_count += 1 }
        else {
            guard l_count > 0 else { return false }
            l_count -= 1
        }
    }
    
    return l_count == 0
}

solution("()()") // true
solution("(())()") // true
