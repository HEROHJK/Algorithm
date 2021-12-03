import Foundation

// MARK: - 튜플
// https://programmers.co.kr/learn/courses/30/lessons/64065
// MARK: -

func tuple(_ s: String) -> [Int] {
    var intArrArr = [[Int]]()
    var s = s
    s.removeFirst()
    s.removeLast()
    
    for numberString in s.components(separatedBy: "},{") {
        let numberString = numberString
            .replacingOccurrences(of: "{", with: "")
            .replacingOccurrences(of: "}", with: "")
        let numbers = numberString.split(separator: ",")
        var intArr = [Int]()
        for number in numbers {
            intArr.append(Int(number)!)
        }
        intArrArr.append(intArr)
    }
    
    intArrArr.sort {
        $0.count < $1.count
    }
    
    var intArr = [Int]()
    
    intArrArr.forEach {
        $0.forEach {
            if !intArr.contains($0) { intArr.append($0) }
        }
    }
    
    
    return intArr
}
