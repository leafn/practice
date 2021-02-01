import Foundation

func divisor(_ yellow: Int) -> ([Int], [Int]) {
    guard yellow > 3 else { return ([1], [yellow]) }
    var arr0 = [Int]()
    var arr1 = [Int]()

    for i in 1...yellow / 2 {
        if yellow % i == 0 {
            arr0.append(i)
            arr1.append(yellow / i)
        }
    }
    return (arr0, arr1)
}

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var result = [Int]()
    var (arr0, arr1) = divisor(yellow)
    for (i, width) in arr1.enumerated() {
        let brownArea = (width + 2) * (arr0[i] + 2)
        if brownArea - yellow == brown && width >= arr0[i] {
            result.append(contentsOf: [width + 2, arr0[i] + 2])
            return result
        }
    }
    
    return result
}

solution(10, 2)  //[4, 3]
solution(8, 1)   //[3, 3]
solution(12, 4)
solution(24, 24) //[8, 6]
