import Foundation

func solution(_ num:Int) -> Int {
    var target = num
    var count = 0
    while target != 1, count < 500 {
        if target % 2 == 0 { target /= 2 }
        else { target = 3 * target + 1 }
        count += 1
    }
    
    return count == 500 && target != 1 ? -1 : count
}

solution(6) // 8
solution(16) // 4
solution(626331) // -1
