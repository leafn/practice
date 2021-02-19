import Foundation

func solution(_ s:String) -> String {
    let s = s.split(separator: " ").map { Int(String($0))! }
    return "\(s.min()!) \(s.max()!)"
}