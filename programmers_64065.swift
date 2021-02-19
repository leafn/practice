import Foundation

func solution(_ s:String) -> [Int] {
    var s = String(s[s.index(after: s.startIndex)..<s.index(before: s.endIndex)])
        .split(separator: "}")
        .map {
            $0.replacingOccurrences(of: "{", with: "")
                .split(separator: ",")
                .map { Int(String($0))! }
        }
    s = s.sorted { $0.count < $1.count }
    
    return s.enumerated().map {
        if $0.offset > 0 { return Set(s[$0.offset]).subtracting(Set(s[$0.offset - 1])).first! }
        else { return $0.element.first! }
    }
}

solution("{{2},{2,1},{2,1,3},{2,1,3,4}}") // [2, 1, 3, 4]
