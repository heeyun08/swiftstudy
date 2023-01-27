func solution(_ a:Int, _ b:Int) -> Int64 {
    guard a != b else { return Int64(a) }
    var aa = a
    var bb = b
    var sum = 0
    if a > b { swap(&aa, &bb) }
    for i in aa...bb{
        sum += i
    }
    return Int64(sum)
}