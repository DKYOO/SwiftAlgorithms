import Foundation

let fileName = "input1.txt"

func readNums() {
    guard let line = try? String(contentsOfFile: fileName) else {
        return
    }
    print ("First \(line)")

    let split = line.split(separator: "\n")

    guard split.count == 1 else {
        return
    }
	print ("Second \(split)")

    let nums = split[0].split(separator: " ")


guard  let a = Int(nums[0]), let b = Int(nums[1]) else {
return
}
    print ("Third \(nums)" )
    let result = String(a + b)
    print ("Final \(result)")
    try? result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
}

readNums()

