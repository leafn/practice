import Foundation

func solution(_ s:String) -> [Int] {
    var count = 0
    var zero_count = 0
    var s = s.map { String($0) }
    while s.count > 1 {
        var filtered = s.filter { $0 == "1" }
        zero_count += s.count - filtered.count
        count += 1
        s = String(filtered.count, radix: 2).map { String($0) }
    }
    
    return [count, zero_count]
}

solution("110010101001")
