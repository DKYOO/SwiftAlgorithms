import Foundation

let fileName = "input0.txt"

func readNums() {
    guard let line = try? String(contentsOfFile: fileName) else {
        return
    }
    let split = line.split(separator: "\n")


   let string = String(split[0])
   let search = String(split[1])

    let index = hasMagic(in: string, search: search)
    let result = String(index)

    try? result.write(toFile: "output.txt", atomically: true, encoding: .utf8)
}

func hasMagic(in string: String, search: String) -> Int {
    
    guard !string.isEmpty, !search.isEmpty else { return -1 }
    guard string.count >= search.count else { return -1 }
    
    let characters: [Character] = Array(string)
    let searchSet: Set<Character> = Set(search)
    
    // Индекс начала подстроки
    var position: Int = 0
    
    while position < characters.count {
        guard position + search.count < characters.count else { break }
        let substring: Set<Character> = Set(characters[position ..< position + search.count])
        // Обе состоят из одних и тех же букв, за исключением одной буквы в каждой из строк
        if searchSet.union(substring).count == searchSet.intersection(substring).count + 1 {
            return position
        }
        position += 1
    }
    
    return -1
}
