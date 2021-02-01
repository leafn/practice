func parent(_ a: Int) -> Int {
    if arr[a] == a { return a }
    arr[a] = parent(arr[a])
    return arr[a]
}

func union(_ a: Int, _ b: Int) {
    let a = parent(a)
    let b = parent(b)
    if a < b { arr[b] = a }
    else { arr[a] = b }
}

func find(_ a: Int, _ b: Int) -> Bool {
    let a = parent(a)
    let b = parent(b)
    if (a == b) { return true }
    else { return false }
}

if let inp = readLine()?.split(separator: " ").map({ Int(String($0))! }) {
    let (n, m) = (inp[0], inp[1])
    arr = [Int](0...n)
    
    for _ in 0..<m {
        if let ins = readLine()?.split(separator: " ").map({ Int(String($0))! }) {
            switch ins[0] {
                case 0: union(ins[1], ins[2])
                case 1:
                    if find(ins[1], ins[2]) == true { print("YES") }
                    else { print("NO") }
                default: break
            }
        }
    }
}