import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    return zip(A.sorted(), B.sorted(by: >)).reduce(0, { $0 + $1.0 * $1.1 })
}

solution([1, 4, 2], [5, 4, 4]) // 29
solution([1, 2], [3, 4]) // 10
