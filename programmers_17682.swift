import Foundation

func solution(_ dartResult:String) -> Int {
    let dart = dartResult.map { $0 }
    var score = [Int]()
    var temp = 0
    var before = Character("#")
    for c in dart {
        if c.isNumber {
            if before.isLetter, temp > 0 {
                score.append(temp)
                temp = 0
            }
            if before.isNumber {
                temp = Int(String(temp) + String(c)) ?? 0
            } else {
                temp = Int(String(c)) ?? 0
            }
        }
        
        switch c {
        case "D":
            temp = Int(pow(Double(temp), Double(2)))
        case "T":
            temp = Int(pow(Double(temp), Double(3)))
        case "*":
            if score.count > 0 { score[score.count - 1] *= 2 }
            score.append(temp * 2)
            temp = 0
        case "#":
            score.append(-temp)
            temp = 0
        default:
            break
        }
        before = c
    }
    if temp > 0 { score.append(temp) }
    
    return score.reduce(0, +)
}