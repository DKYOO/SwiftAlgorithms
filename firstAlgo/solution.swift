import Foundation

let fileName = "input0.txt"

func readNums() {
    guard let line = try? String(contentsOfFile: fileName) else {
        return
    }
    let split = line.split(separator: "\n")


   let nums = split[2].split(separator: " ").map { Int ($0)! }
   let letters = split[1].map { String ($0) }

	let index = maxDiff(nums: nums)
	let result = letters[index]

	try? result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
}

func maxDiff(nums: [Int])->Int {
    var maxDiff = nums[0]
    var index = 0
    
    for i in 1..<nums.count
    {
        if maxDiff <= nums[i] - nums[i - 1] {
            maxDiff = nums[i] - nums[i - 1]
            index = nums[i]
        }
    }
    return ((nums.lastIndex(of: index) ?? 0))
}

readNums()

