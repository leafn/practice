func solution(_ x:Int, _ n:Int) -> [Int64] {
    return x != 0 ? stride(from: x, through: x * n, by: x).map { Int64($0) } : [Int64](repeating: 0, count: n)
}

solution(2, 5) // [2, 4, 6, 8, 10]
solution(2, 1)
solution(-2, 1)
solution(-10000000, 1000)
solution(10000000, 1000)
solution(0, 10)
