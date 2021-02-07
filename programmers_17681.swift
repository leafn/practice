import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return zip(arr1, arr2).map {
        String($0.0 | $0.1, radix: 2)
            .replacingOccurrences(of: "1", with: "#")
            .replacingOccurrences(of: "0", with: " ")
    }.map {
        $0.count < n ? String(repeating: " ", count: n - $0.count) + $0 : $0
    }
}
solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]) //  ["#####","# # #", "### #", "# ##", "#####"]
