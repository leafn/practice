import Foundation

func solution(_ n:Int) -> Int
{
    var target = n + 1
    
    while n.nonzeroBitCount != target.nonzeroBitCount {
        target += 1
    }
    return target
}