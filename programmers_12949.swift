import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = [[Int]]()
    var converted = [[Int]]()
    
    (0..<arr2[0].count).forEach { i in
        var temp = [Int]()
        (0..<arr2.count).forEach { j in
            temp.append(arr2[j][i])
        }
        converted.append(temp)
    }
    
    arr1.forEach { l in
        var temp = [Int]()
        converted.forEach { r in
            var s = 0
            (0..<l.count).forEach {
                s += l[$0] * r[$0]
            }
            temp.append(s)
        }
        result.append(temp)
    }
    
    
    return result
}

solution([[1, 4], [3, 2], [4, 1]], [[3, 3], [3, 3]])
solution([[2, 3, 2], [4, 2, 4], [3, 1, 4]], [[5, 4, 3], [2, 4, 1], [3, 1, 1]])



