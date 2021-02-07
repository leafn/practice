func solution(_ x:Int) -> Bool {
    return x % String(x).compactMap({ $0.wholeNumberValue }).reduce(0, +) == 0
}

solution(10) // t
solution(12) // t
solution(11) // f
solution(13) // f
