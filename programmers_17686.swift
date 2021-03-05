import Foundation

func split(_ file: String) -> [String] {
    var file = file
    var h = String()
    var n = String()
    var t = String()
    
    for (i, v) in file.enumerated() {
        if v.isNumber {
            h = String(file[file.startIndex..<file.index(file.startIndex, offsetBy: i)])
            file = String(file[file.index(file.startIndex, offsetBy: i)..<file.endIndex])
            break
        }
    }
    for (i, v) in file.enumerated() {
        if !v.isNumber {
            n = String(file[file.startIndex..<file.index(file.startIndex, offsetBy: i)])
            t = String(file[file.index(file.startIndex, offsetBy: i)..<file.endIndex])
            break
        } else if n.count == 0 && i == file.count - 1 {
            n = file
            file = ""
        }
    }
    
    return [h, n, t]
}

func solution1(_ files:[String]) -> [String] {
    var split_arr = files.map { split($0) }
    split_arr = split_arr.sorted {
        if $0[0].lowercased() != $1[0].lowercased() {
            return $0[0].lowercased() < $1[0].lowercased()
        } else {
            return Int($0[1])! < Int($1[1])!
        }
    }
    return split_arr.map { $0.joined() }
}

// 보면서 반성하자...

extension String {
    var numeric: ClosedRange<Character> { return "0"..."9" }
    var head: String { self.prefix { numeric.contains($0) == false }.uppercased() }
    var number: Int {
        Int(self.drop { numeric.contains($0) == false }
                .prefix { numeric.contains($0) == true }
        )!
    }
}

func solution(_ files:[String]) -> [String] {

    return files.enumerated().sorted { (lhs, rhs) in
        let l = lhs.element
        let r = rhs.element
        if l.head != r.head { return l.head < r.head}
        if l.number != r.number { return l.number < r.number}
        return lhs.offset < rhs.offset

    }.map{ $0.element }
}


solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"])
// ["img1.png", "IMG01.GIF", "img02.png", "img2.JPG", "img10.png", "img12.png"]
solution(["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"])
// ["A-10 Thunderbolt II", "B-50 Superfortress", "F-5 Freedom Fighter", "F-14 Tomcat"]