func solution(_ s:String) -> String {
    var arr = s.components(separatedBy: " ")
    var word = [String]()
    var ans = [String]()
    for a in arr {
        var tmp = Array(a)
        for i in 0..<tmp.count {
            word.append(i % 2 == 0 ? tmp[i].uppercased() : tmp[i].lowercased())
        }
        ans.append(word.joined())
        word = []
    }
    return ans.joined(separator: " ")
}