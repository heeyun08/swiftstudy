import Foundation

func solution(_ s:String) -> [Int] {
    var ansArr = [Int](repeating: -1, count: s.count)
    
    for i in 1..<s.count{
        for n in stride(from: i-1, to: -1, by: -1){
            if Array(s)[i]==Array(s)[n]{
                ansArr[i] = i-n
                break
            }
        }
    }
    
    return ansArr
}