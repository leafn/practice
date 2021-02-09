import Foundation

extension String {
    func components(withLength length: Int) -> [String] {
        return stride(from: 0, to: count, by: length).map {
            let start = self.index(self.startIndex, offsetBy: $0)
            let end = self.index(start, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            return String(self[start..<end])
        }
    }
}

func solution(_ s:String) -> Int {
    
    var result = 1000
    for i in 1...s.count {
        let arr = s.components(withLength: i)
        var compressed = ""
        var before = ""
        var rep = 0
        for (_, v) in arr.enumerated() {
            if v == before {
                rep += 1
            } else {
                if rep > 1 { compressed.append(String(rep)) }
                compressed.append(before)
                before = v
                rep = 1
            }
        }
        if rep > 1 { compressed.append(String(rep)) }
        compressed.append(before)
        result = min(result, compressed.count)
    }
    return result
}

solution("aabbaccc") // 7
