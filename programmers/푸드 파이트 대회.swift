import Foundation

func solution(_ food:[Int]) -> String {
    var ans = [Int]()
    var res = [Int]()
    for (i, num) in food.enumerated(){
        for _ in 0..<num/2{
            ans.append(i)
        }
    }
    res = ans.reversed()
    ans.append(0)
    ans.append(contentsOf: res)

    let myResult = ans.map(String.init).joined()
    return myResult
}