import Foundation

struct Heap<T> {
    private var order: (T, T) -> Bool
    
    private var arr = [T]()
    
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

func heapSort<T>(_ arr: [T], order: @escaping (T, T) -> Bool) -> [T] {
    let reverseOrder = { i1, i2 in order(i2, i1) }
    var heap = Heap(arr, order: reverseOrder)
    return heap.sort()
}

var heap = Heap<Int>([9, 7, 6, 5, 4, 3, 2, 2, 1, 3], order: >) // max heap
print(heapSort([9, 7, 6, 5, 4, 3, 2, 2, 1, 3], order: <))


