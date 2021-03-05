import Foundation

func solution(_ s:String) -> String {
    var s = s.map { String($0) }
    
    var before = " "
    s.enumerated().forEach { i, v in
        if before == " ", v != " " { s[i] = s[i].uppercased() }
        else { s[i] = s[i].lowercased() }
        before = v
    }
    
    print(s.joined())
    
    
    return ""
}

solution("  people unFollowed me") // "3people Unfollowed Me"
solution("for the last week") // "For The Last Week"
