func solution(_ n:Int64) -> Int64 {
    var arr = String(n).map{ Int64(String($0))! }.sorted(by: >)
    return Int64(arr.map{ String($0) }.joined())!
}