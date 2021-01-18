import Foundation

struct Heap<T> {
    private var order: (T, T) -> Bool
    
    public var arr = [T]()
    
    init(order: @escaping (T, T) -> Bool) {
        self.order = order
    }
    
    init(_ target: [T], order: @escaping (T, T) -> Bool) {
        self.order = order
        buildHeap(target)
    }
    
    var isEmpty: Bool { arr.isEmpty }
    var count: Int { arr.count }
    
    var description: String { arr.description }
    
    mutating func buildHeap(_ arr: [T]) {
        self.arr = arr
        for i in stride(from: (count / 2 - 1), through: 0, by: -1) {
            shiftDown(index: i, heapSize: count)
        }
    }
    
    public func peek() -> T? {
        return arr.first
    }
    
    mutating func insert(_ e: T){
        arr.append(e)
        shiftUp(index: count - 1)
    }
    
    @discardableResult
    mutating func remove() -> T? {
        guard !isEmpty else { return nil }
        guard count > 1 else { return arr.removeFirst() }
        
        let first = arr.first!
        arr[0] = arr.removeLast()
        shiftDown(index: 0, heapSize: count)
    
        return first
    }
    
    @discardableResult
    mutating func remove(at i: Int) -> T? {
        guard i < count else { return nil }
        
        let size = count - 1
        if i != size {
            arr.swapAt(i, size)
            shiftDown(index: i, heapSize: size)
            shiftUp(index: i)
        }
        
        return arr.removeLast()
    }
    
    mutating func replace(_ i: Int, v: T) {
        guard i < count else { return }
        
        remove(at: i)
        insert(v)
    }
    
    mutating func sort() -> [T] {
        for i in stride(from: count - 1, through: 1, by: -1) {
            arr.swapAt(0, i)
            shiftDown(index: 0, heapSize: i)
        }
        
        return arr
    }
    
    private mutating func shiftUp(index: Int) {
        guard index > 0 else { return }
        
        var targetIndex = index
        var parentIndex = parent(targetIndex)
        
        while targetIndex > 0 && order(arr[targetIndex], arr[parentIndex]) {
            arr.swapAt(targetIndex, parentIndex)
            targetIndex = parentIndex
            parentIndex = parent(parentIndex)
        }
    }
    
    private mutating func shiftDown(index: Int, heapSize: Int) {
        guard heapSize > 0 else { return }
        
        let index = index
        let leftIndex = left(index)
        let rightIndex = right(index)
        
        var maxIndex = index
        if leftIndex < heapSize && order(arr[leftIndex], arr[maxIndex]) { maxIndex = leftIndex }
        if rightIndex < heapSize && order(arr[rightIndex], arr[maxIndex]) { maxIndex = rightIndex }
        if maxIndex == index { return }
        
        arr.swapAt(index, maxIndex)
        shiftDown(index: maxIndex, heapSize: heapSize)
    }
    
    @inline(__always) private func parent(_ i: Int) -> Int { Int(floor((Double(i) - 1) / 2)) }
    @inline(__always) private func left(_ i: Int) -> Int { 2 * i + 1 }
    @inline(__always) private func right(_ i: Int) -> Int { left(i) + 1 }
}

func solution(_ jobs:[[Int]]) -> Int {
    let count = jobs.count
    var jobs = jobs.sorted { $0[0] < $1[0] }
    
    var time = 0
    var result = 0
    
    while !jobs.isEmpty {
        if time >= jobs.first![0] {
            let filtered = jobs.filter { $0[0] <= time }
            var heap = Heap<[Int]>(filtered) { $0[1] < $1[1] }
            let peek = heap.peek()!
            //print(peek)
            time += peek[1]
            result += time - peek[0]
            heap.arr.removeFirst()
            jobs = heap.arr + jobs[heap.count + 1..<jobs.count]
        } else { time = jobs.first![0] }
    }
    
    return result / count
}

//solution([[0, 3], [1, 9], [2, 6]])
//solution([[0,1], [1,2], [500,6]])
solution([[0, 10], [2,10], [9,10], [15,2]])
