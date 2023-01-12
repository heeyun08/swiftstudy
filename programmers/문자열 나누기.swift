import Foundation

func solution(_ s:String) -> Int {
    var str = Array(s)
    var cntX = 0
    var cntY = 0
    var split = 0
    var idx = 0
    
    for i in 0..<s.count{
        cntX = 1
        cntY = 0
        if idx >= s.count{
            break
        }
        for j in idx+1..<s.count{
            if str[idx] == str[j]{
                cntX += 1
            } else {
                cntY += 1
            }
            if cntX == cntY{
                split += 1
                idx = 1+j
                break
            }
        }
        if i == s.count-1 && (cntX > 0 || cntY > 0){
            split += 1
        }
    }
    
    return split
}