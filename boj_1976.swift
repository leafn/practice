//
//  main.swift
//  algorithm
//
//  Created by leafN on 2021/02/01.
//

import Foundation

var arr = [Int]()

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
    let n = inp[0]
    arr = [Int](0..<n)
    if let inp = readLine()?.split(separator: " ").map({ Int(String($0))! }) {
        let m = inp[0]
        for i in 0..<n {
            if let inp = readLine()?.split(separator: " ").map({ Int(String($0))! }) {
                for (idx, val) in inp.enumerated() {
                    if val == 1 { union(i, idx) }
                }
            }
        }
    }
    if let inp = readLine()?.split(separator: " ").map({ Int(String($0))! }) {
        for i in 0..<inp.count-1 {
            if find(inp[i] - 1, inp[i+1] - 1) == false {
                print("NO")
                break
            } else if i == inp.count - 2 {
                print("YES")
            }
        }
    }
}
