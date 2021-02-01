import Foundation

func foo(_ res: [Int], _ arr: [Int], _ limit: Int) {
    guard res.count < limit else {
        for i in 0..<res.count - 1 {
            if res[i] > res[i + 1] { return }
        }
        var res = res
        let first = res.removeFirst()
        print(res.map({ String($0) }).reduce(String(first), {$0 + " " + $1 }))
        return
    }
    for i in 0..<arr.count {
        var arr = arr
        let first = arr[i]
        _ = arr.remove(at: i)
        var res = res
        res.append(first)
        foo(res, arr, limit)
    }
}

if let inp = readLine()?.split(separator: " ").map({ Int(String($0))! }) {
    let (n, m) = (inp[0], inp[1])
    
    foo([], [Int](1...n), m)
}