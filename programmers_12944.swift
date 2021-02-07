import Foundation

func solution(_ arr:[Int]) -> Double {
    return Double(arr.reduce(0, +)) / Double(arr.count)
}

solution([1, 2, 3, 4]) // 2.5
solution([5, 5]) // 5
