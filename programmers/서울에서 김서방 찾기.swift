func solution(_ seoul:[String]) -> String {
    return "김서방은 \(seoul.firstIndex { (name) -> Bool in return name == "Kim" }!)에 있다"
}