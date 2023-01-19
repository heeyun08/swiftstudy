import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var nn = n
    var crr = 0
    var ans = 0
    while nn >= a {
        crr = nn%a + b * (nn/a)
        ans += b * (nn/a)
        nn = crr
    }
    return ans
}