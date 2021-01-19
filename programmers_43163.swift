import Foundation

var result = 0

func dfs(_ begin: String, _ target: String, _ words: [String], _ count: Int) {
    let words = words.filter { $0 != begin }
    //if result != 0 { return }
    if begin == target {
        result = min(result, count)
        if result == 0 { result = count }
        else { result = min(result, count) }
        return
    }
    
    for (_, word) in words.enumerated() {
        let w = Array(word)
        let b = Array(begin)
        if w.enumerated().filter({ b[$0.offset] != $0.element }).count == 1 {
            dfs(word, target, words, count + 1)
        }
    }
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target) == true else { return 0 }
    dfs(begin, target, words, 0)
    
    
    return result
}

solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])
solution("hit", "cog", ["hot", "dot", "dog", "lot", "log"])
