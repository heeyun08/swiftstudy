import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var msr = [Int]()
    var msrNum = [Int]()
    for i in left...right{
        for j in 1...i{
            if i % j == 0 { msr.append(j) }
        }
        msrNum.append(msr.count)
        msr = []
    }
    return (left...right).map{ msrNum[$0-left] % 2 == 0 ? $0 : -$0 }.reduce(0,+)
}