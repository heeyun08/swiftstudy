import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let ans = (1...count).map{ $0*price }.reduce(0,+)
    
    return ans > money ? Int64(ans-money) : 0
}