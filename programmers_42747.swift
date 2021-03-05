func solution(_ citations:[Int]) -> Int {
    let citations = citations.sorted(by: >)
    var h_index = 0
    for c in citations {
        if c <= h_index { break }
        h_index += 1
    }
    
    return h_index
}
solution([3, 0, 6, 1, 5]) // 3
