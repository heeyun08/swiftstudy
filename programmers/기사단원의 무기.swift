import Foundation

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var msrArr = [Int]()
    var msr = 0
    var pw = 0
    var ans = 0

    for i in 1...number{
        for j in 1...Int(sqrt(Double(number))){
            msr = i % j
            if msr == 0{
                msrArr.append(j)
            }
        }
        for k in msrArr{
            msr = i / k
            msrArr.append(msr)
        }
        msrArr = msrArr.uniqued()
        
        pw = msrArr.count
        if pw > limit{
            ans += power
        } else {
            ans += pw
        }
        msrArr = []
    }
    
    return ans
}