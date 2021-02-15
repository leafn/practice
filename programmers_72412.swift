import Foundation

func binarySearch<T: Comparable>(_ arr: [T], key: T) -> Int {
    var lowerBound = 0
    var upperBound = arr.count
    while lowerBound < upperBound {
        let midIndex = (lowerBound + upperBound) / 2
        if key <= arr[midIndex] {
            upperBound = midIndex
        } else {
            lowerBound = midIndex + 1
        }
    }
    return lowerBound
}

func permutations(target: [String]) -> [String] {
    var arr = [String]()
    func permute(_ k: Int, _ str: String) {
        guard k < target.count else {
            arr.append(str)
            return
        }
        
        permute(k + 1, str + "-")
        permute(k + 1, str + target[k])
    }
    
    permute(0, "")
    return arr
}

func solution(_ info: [String], _ query: [String]) -> [Int] {
    var result = [Int]()
    
    let info = info.map { $0.split(separator: " ").map { String($0) } }
    var dict = [String: [Int]]()
    info.forEach { i in
        permutations(target: Array(i[0..<4])).forEach {
            if dict[$0] != nil {
                dict[$0]?.append(Int(i[4])!)
            } else {
                dict[$0] = [Int(i[4])!]
            }
        }
    }
    
    dict.keys.forEach { dict[$0] = dict[$0]?.sorted(by: <) }

    query.forEach {
        let q = $0.split(separator: " ").filter { $0 != "and" }
        let key = q[0..<4].joined()
        let value = Int(q[4])!
        if let arr = dict[key] { result.append(arr.count - binarySearch(arr, key: value))}
        else { result.append(0) }
    }
    
    return result
}

solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]) // [1,1,1,1,2,4]
