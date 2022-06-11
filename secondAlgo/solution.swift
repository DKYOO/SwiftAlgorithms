import Foundation
let fileName = "input0.txt"
//change fileName only

func readNums() {
    guard let line = try? String(contentsOfFile: fileName) else {
        return
    }
    let split = line.split(separator: "\n")
    guard let num = Int(split[0]) else { return }

    var users  = split.map { String ($0)}
    users.remove(at: 0)

    let result = String(uniqUsers(users, num))

    try? result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
	// we can write inly Strings 😔 
}

func uniqUsers(_ users: [String], _ num: Int) -> Int {
    
    var uniqUsers: [String] = []
    
    for i in 0..<num {
        let str = users[i]
        let substrings = str.split(separator: "@")
        var user = substrings[0]
        var domen = substrings[1]
        user = user.split(separator: "-")[0]
        user.removeAll(where: { $0 == "." })
        domen.removeSubrange(domen.lastIndex(of: ".")!..<domen.endIndex)
        uniqUsers.insert(user + "@" + domen, at: i)
    }
    
    return Set(users).count
}

readNums()
