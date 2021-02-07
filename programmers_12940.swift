import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 {
        return b
    }
    return gcd(b, a % b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution(_ n:Int, _ m:Int) -> [Int] {
    return [gcd(n, m), lcm(n, m)]
}

solution(3, 12) // [3, 12]
solution(2, 5) // [1, 10]
