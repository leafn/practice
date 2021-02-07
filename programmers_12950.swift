func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = [[Int]]()
    for (e1, e2) in zip(arr1, arr2) {
        var arr = [Int]()
        for i in 0..<e1.count {
            arr.append(e1[i] + e2[i])
        }
        result.append(arr)
    }
    
    return result
}
solution([[1, 2], [2, 3]], [[3,4],[5,6]])
