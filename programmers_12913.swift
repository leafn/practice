import Foundation

func solution(_ land:[[Int]]) -> Int{
    var arr = [[Int]](repeating: [Int](repeating: 0, count: 4), count: land.count)
    arr[0] = land[0]
    
    (1..<land.count).forEach {
        arr[$0][0] = land[$0][0] + max(arr[$0 - 1][1], arr[$0 - 1][2], arr[$0 - 1][3])
        arr[$0][1] = land[$0][1] + max(arr[$0 - 1][0], arr[$0 - 1][2], arr[$0 - 1][3])
        arr[$0][2] = land[$0][2] + max(arr[$0 - 1][0], arr[$0 - 1][1], arr[$0 - 1][3])
        arr[$0][3] = land[$0][3] + max(arr[$0 - 1][0], arr[$0 - 1][1], arr[$0 - 1][2])
    }
    
    return arr[land.count - 1].max()!
}

solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]])
