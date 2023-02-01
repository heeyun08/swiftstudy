func solution(_ n:Int, _ m:Int) -> [Int] {
    var gcd = 0
    var a = max(n,m)
    var b = min(n,m)
    
    while b != 0 {
        gcd = a%b
        a = b
        b = gcd
    }
    return [a, n*m/a]
}