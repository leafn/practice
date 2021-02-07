func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var result = 0
    let skill = skill.map { String($0) }
    let skill_trees = skill_trees
        .map { $0.map { String($0) }.filter { skill.contains($0) } }
    for s in skill_trees {
        var skill = skill[0..<s.count]
        if skill.elementsEqual(s) { result += 1 }
    }
    
    return result
}