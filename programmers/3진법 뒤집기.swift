import Foundation

func solution(_ n:Int) -> Int {
    var three = String(n, radix: 3)
    var reverse = String(Array(three).reversed())
    return Int(reverse, radix: 3)!
}