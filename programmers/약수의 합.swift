func solution(_ n:Int) -> Int {
    var ans = 0
    guard n != 0 else { return 0 }
    for i in 1...n{
        if n%i==0{ ans+=i }
    }
    return ans
}