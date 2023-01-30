func solution(_ phone_number:String) -> String {
    var num = Array(phone_number)
    for i in 0..<num.count-4{
        num[i] = "*"
    }
    return String(num)
}