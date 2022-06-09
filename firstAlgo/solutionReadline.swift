import Foundation
let num = Int(readLine()!)!
let str = Array(readLine()!)

var numbers = readLine()!.split(separator: " ").map { Int($0)! }
var maxDiff = numbers[0]
var index = 0

for i in 1..<numbers.count
{
    if maxDiff <= numbers[i] - numbers[i - 1] {
        maxDiff = numbers[i] - numbers[i - 1]
        index = numbers[i]
    }
}
let a = numbers.lastIndex(of: index) ?? 0
print(str[a])
