func solution(_ num:Int) -> Int {
    var n = num
    if num == 1 { return 0 }
    for i in 1...500{
        n = n % 2 == 0 ? n / 2 : (n*3)+1
        if n == 1{ return i }
    }
    return -1
}