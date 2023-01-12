import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var ans = 0
    var t_arr = Array(t)
    
    for idx in 0...(t.count-p.count){
        let sub = String(t_arr[idx..<(idx+p.count)])
        
        if Int(sub)! <= Int(p)!{
            ans += 1
        }
    }
    return ans
}