func solution(_ arr:[Int]) -> Double {
    var ans = 0.0
    for i in arr{
        ans += Double(i)
    }
    return ans/Double(arr.count)
}