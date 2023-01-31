func solution(_ s:String) -> String {
    let arr = Array(s)
    let idx = (s.count-1)/2
    return s.count % 2 == 0 ? "\(arr[idx])\(arr[idx+1])" : "\(arr[idx])"
}