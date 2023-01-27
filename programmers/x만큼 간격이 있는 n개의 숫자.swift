func solution(_ x:Int, _ n:Int) -> [Int64] {
    let arr = [Int64](repeating: Int64(x), count: n)
    var ans = [Int64]()
    for i in 0..<n{
        ans.append(arr[i]*(Int64(i)+1))
    }
    return ans
}