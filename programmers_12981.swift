import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var dict = [String: Bool]()
    for (i, v) in words.enumerated() {
        if dict[v] != nil || (i > 0 && words[i - 1].last! != v.first!) { return [(i % n) + 1, (i / n) + 1] }
        dict.updateValue(true, forKey: v)
    }
    return [0, 0]
}

solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"])
solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"])
solution(2, ["hello", "one", "even", "never", "now", "world", "draw"])
