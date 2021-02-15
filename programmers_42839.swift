import Foundation

var isPrime = [Bool]()
var set = Set<Int>()

func prime(_ m: Int) {
    isPrime = [Bool](repeating: true, count: m + 1)
    isPrime[0] = false
    isPrime[1] = false
    for i in 2...m {
        if isPrime[i] == false { continue }
        for j in stride(from: 2 * i, through: m, by: i) { isPrime[j] = false }
    }
}

func permute(_ numbers: [String], _ n: Int, _ t: [String]) {
    if n == 0 {
        set.insert(Int(t.joined())!)
    } else {
        (0..<numbers.count).forEach {
            var numbers = numbers
            var t = t
            t.append(numbers.remove(at: $0))
            permute(numbers, n - 1, t)
        }
    }
}

func solution(_ numbers:String) -> Int {
    set = Set<Int>()
    let numbers = numbers.map { String($0) }
    (1...numbers.count).forEach { permute(numbers, $0, []) }
    prime(set.max()!)
    var count = 0
    set.forEach {
        if isPrime[$0] { count += 1 }
    }
    
    return count
}

solution("17") // 3
solution("011") // 2
