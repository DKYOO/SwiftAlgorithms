import Foundation

let fileName = "input0.txt"

func readNums() {
    guard let line = try? String(contentsOfFile: fileName) else {
        return
    }
    let split = line.split(separator: "\n")


   let nums = split[1].split(separator: " ").map { Int ($0)! }
    let result = String(maxTrade(nums))

    try? result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
}

func maxTrade(_ prices: [Int]) -> Int {
    var maxProfit = 0
    var minPrice = prices[0]
    
    if prices.isEmpty {
        return maxProfit
    }
    
    for i in 0..<prices.count {
        if prices[i]<minPrice {
            minPrice = prices[i]
        } else {
            maxProfit += prices[i] - minPrice
            minPrice = prices[i]
        }
    }
    return maxProfit
}
readNums()
