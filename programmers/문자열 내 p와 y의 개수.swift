import Foundation

func solution(_ s:String) -> Bool {
    var arr = Array(s.lowercased())
    return arr.filter{$0 == "p"}.count == arr.filter{$0 == "y"}.count
}