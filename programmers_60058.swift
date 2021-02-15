import Foundation

func parse(_ u: String, _ v: String) -> (String, String) {
    guard v.count > 0 else { return (u, v) }
    var before_u = u
    var u = String()
    var v = v.map { String($0) }
    var isCorrect = true
    
    var l_count = 0
    var r_count = 0
    while ((l_count == 0 && r_count == 0) || (l_count != r_count)) && v.count > 0 {
        let first = v.remove(at: 0)
        if r_count > l_count { isCorrect = false }
        if first == "(" { l_count += 1 }
        else { r_count += 1 }
        u += first
    }
    
    if isCorrect {
        return parse(before_u + u, v.joined())
    } else {
        var sub_u = Array(u[u.index(u.startIndex, offsetBy: 1)..<u.index(u.endIndex, offsetBy: -1)]).map {
            if $0 == "(" { return ")" }
            else { return "(" }
        }.joined()
        return (before_u  + "(" + parse("", v.joined()).0 + ")" + sub_u, "")
    }
}

func solution(_ p:String) -> String {
    guard p.count > 0 else { return p }
    
    return parse("", p).0
}

solution("(()())()") // "(()())()"
solution(")(") // "()"
solution("()))((()") // "()(())()"
