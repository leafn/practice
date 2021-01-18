import Foundation

var count = 0

func dfs(_ numbers: [Int], _ target: Int, _ sum: Int, _ idx: Int) {
    if idx >= numbers.count {
        if sum == target {
            count += 1
        }
        return
    }
    
    dfs(numbers, target, sum + numbers[idx], idx + 1)
    dfs(numbers, target, sum - numbers[idx], idx + 1)
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    dfs(numbers, target, 0, 0)
    return count
}