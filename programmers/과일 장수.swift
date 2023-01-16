import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var scoreArr = score
    var idx = 0
    var ans = 0
    
    scoreArr.sort(by: >)
    for _ in 0..<score.count{
        if idx > score.count-m{
            break
        }
        ans += scoreArr[idx+(m-1)] * m
        idx += m
    }
    
    return ans
}