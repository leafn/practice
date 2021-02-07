import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    let d = d.sorted(by: <)
    var budget = budget
    var count = 0
    
    for d_budget in d {
       budget -= d_budget
        if budget > 0 { count += 1 }
        else if budget < 0 {
            break
        } else {
            count += 1
            break
        }
    }
    
    return count
}

solution([1, 3, 2, 5, 4], 9) // 3
solution([2, 2, 3, 3], 10) // 4