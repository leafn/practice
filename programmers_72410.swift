import Foundation

extension String{
    func getArrayAfterRegex(regex: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}

func solution(_ new_id:String) -> String {
    
    // #1
    var new_id = new_id.lowercased()
    // #2
    new_id = new_id.getArrayAfterRegex(regex: "[a-z0-9\\-\\_\\.]").reduce("", +)
    // #3
    var third = ""
    for (_, v) in new_id.enumerated() {
        let suffix = String(third.suffix(1))
        if suffix == ".", String(v) == "." { continue }
        else { third.append(v) }
    }
    new_id = third
    // #4
    if new_id.hasPrefix(".") { new_id = String(new_id.dropFirst()) }
    if new_id.hasSuffix(".") { new_id = String(new_id.dropLast()) }
    // #5
    if new_id.count == 0 { new_id = "a" }
    // #6
    if new_id.count > 15 { new_id = String(new_id[new_id.startIndex..<new_id.index(new_id.startIndex, offsetBy: 15)]) }
    if new_id.suffix(1) == "." { new_id = String(new_id.dropLast()) }
    // #7
    if new_id.count < 3 {
        new_id = new_id + [String](repeating: String(new_id.suffix(1)), count: 3 - new_id.count).joined()
    }

    return new_id
}