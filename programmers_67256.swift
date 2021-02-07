import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let numbers = numbers
        .map { $0 == 0 ? 11 : $0 }
        .map { ($0, $0 % 3 == 0 ? ($0 / 3 - 1, 2) : ($0 / 3, $0 % 3 - 1)) }
    var result = [String]()
    var left = (3, 0)
    var right = (3, 2)
    for (number, point) in numbers {
        switch number {
        case 1, 4, 7:
            result.append("L")
            left = point
        case 3, 6, 9:
            result.append("R")
            right = point
        default:
            let l_dist = abs(left.0 - point.0) + abs(left.1 - point.1)
            let r_dist = abs(right.0 - point.0) + abs(right.1 - point.1)
            if l_dist < r_dist {
                left = point
                result.append("L")
            } else if l_dist > r_dist {
                right = point
                result.append("R")
            } else {
                if hand == "left" {
                    left = point
                    result.append("L")
                }
                else {
                    right = point
                    result.append("R")
                }
            }
        }
    }
    
    return result.joined()
}