import Foundation

let fileName = "input1.txt"
// Change fileName only 

func readNums() {
    guard let line = try? String(contentsOfFile: fileName) else {
        return
    }
												
    let split = line.split(separator: "\n")
    guard split.count == 2 else { return }

    let arr = split[1].split(separator: " ").map { Int ($0)! }

    let result = String(bestItem(arr)) 

    try? result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
}

func maxNegative(array: [Int]) -> Int {
var newArr: [Int] = []
    for i in array {
        if i < 0 {
            newArr.append(i)
        }
    }
    return newArr.max() ?? 0
}

func minNegative(array: [Int]) -> Int {
var newArr: [Int] = []
    for i in array {
        if i < 0 {
            newArr.append(i)
        }
    }
    return newArr.min() ?? 0
}
func minPositive(array: [Int]) -> Int {
var newArr: [Int] = []
	for i in array {
		if i > 0 {
		newArr.append(i)
		}
	}
	return newArr.min() ?? 0
} 

func numberOfNegative(array: [Int]) -> Int {
var newArr: [Int] = []
    for i in array {
        if i < 0 {
            newArr.append(i)
        }
    }
    return newArr.count
}

func bestItem(_ array: [Int]) -> Int  {
    
    var minPos = 0
    var minNeg = 0
    var maxNeg = 0
    var zeroInArray: Bool = false
    
    let numberOfNegative = numberOfNegative(array: array)
    let summ = array.reduce(1, *)
    
    for i in array {
        if i == 0 { zeroInArray = true }
        
        if i < 0 {
            minNeg = minNegative(array: array)
            maxNeg = maxNegative(array: array)
            }
        if i > 0 {
            minPos = minPositive(array: array)
        }
        
    }
    
    if zeroInArray == true {
        if summ >= 0 && numberOfNegative % 2 == 0 {
            return 0
        } else {
            return maxNeg
        }
        
    } else {
        if summ > 0 && numberOfNegative == 0 {
            return minPos
        }
        if summ > 0 && numberOfNegative % 2 == 0 {
            return minNeg
        } else {
            return maxNeg
        }
    }
}

readNums()
