import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var ansArr = [Int]()
    var kArr = [Int]()
    var tmp = [Int]()
    var min = 0
    
    for s in score{
        if kArr.count==k{
            min = kArr[0]
            kArr.removeFirst()
        }
        if s > min{
            kArr.append(s)
        } else{
            kArr.append(min)
        }
        kArr.sort()
        ansArr.append(kArr[0])
    }
    
    return ansArr
}