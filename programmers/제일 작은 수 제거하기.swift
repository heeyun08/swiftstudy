func solution(_ arr:[Int]) -> [Int] {
    var ans = arr
    var min = arr[0]
    var idx = 0
    for i in 0..<arr.count{
        if min > arr[i] {
            min = arr[i]
            idx = i
        }
    }
    ans.remove(at: idx)
    return ans.isEmpty ? [-1] : ans
}