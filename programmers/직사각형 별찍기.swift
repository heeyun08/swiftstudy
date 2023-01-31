import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }

for _ in 0..<n[1]{
    print(String(repeating: "*", count: n[0]))
}