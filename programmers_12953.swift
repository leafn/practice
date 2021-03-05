import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    let mod: Int = a % b
    return 0 == mod ? min(a, b) : gcd(b, mod)
}
 
func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution(_ arr:[Int]) -> Int {
    var l = lcm(arr[0], arr[1])
    
    (2..<arr.count).forEach { i in
        l = lcm(l, arr[i])
    }
    
    return l
}

solution([2, 6, 8, 14]) // 168
solution([1, 2, 3]) // 6
