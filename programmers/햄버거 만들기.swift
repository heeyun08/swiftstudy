// 정확성 94.4
// 테스트 케이스 2번 실패
import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var arr = ingredient
    var ans = 0
    
    for i in ingredient{
        arr.append(i)
        if arr.count < 4 {
            continue
        } else if Array(arr.suffix(4)) == [1,2,3,1]{
            ans += 1
            arr.removeLast(4)
        }
    } 
    return ans
}