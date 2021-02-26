import Foundation

func solution(_ n:Int) -> Int {
    var arr = [Int](repeating: -1, count: 100001)
    arr[0] = 0
    arr[1] = 1
    (2...n).forEach {
        arr[$0] = (arr[$0 - 1] + arr[$0 - 2]) % 1234567
    }
    
    return arr[n]
}

//solution(3) // 2
solution(100000) // 5
