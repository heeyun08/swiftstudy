import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var ans = 0
    for i in 0..<signs.count{
        ans = signs[i] ? ans + absolutes[i] : ans - absolutes[i]
    }
    return ans
}