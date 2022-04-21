import Foundation

// MARK: - 짝지어 제거하기
// https://programmers.co.kr/learn/courses/30/lessons/12973
// MARK: -

// 문제 유형도 구분 못하고 몇번을 푸는거야..
// MARK 5 - character Array
//정확성  테스트
//테스트 1 〉    통과 (0.04ms, 16.5MB)
//테스트 2 〉    통과 (30.32ms, 16.8MB)
//테스트 3 〉    통과 (32.81ms, 17.3MB)
//테스트 4 〉    통과 (32.88ms, 18MB)
//테스트 5 〉    통과 (49.44ms, 17.9MB)
//테스트 6 〉    통과 (32.88ms, 17.9MB)
//테스트 7 〉    통과 (34.63ms, 17.9MB)
//테스트 8 〉    통과 (35.64ms, 17.8MB)
//테스트 9 〉    통과 (0.03ms, 16.3MB)
//테스트 10 〉    통과 (0.07ms, 16.4MB)
//테스트 11 〉    통과 (0.05ms, 16.1MB)
//테스트 12 〉    통과 (0.04ms, 16.2MB)
//테스트 13 〉    통과 (0.05ms, 16.2MB)
//효율성  테스트
//테스트 1 〉    통과 (343.78ms, 40MB)
//테스트 2 〉    통과 (269.29ms, 31.3MB)
//테스트 3 〉    통과 (358.19ms, 36.4MB)
//테스트 4 〉    통과 (345.15ms, 36.2MB)
//테스트 5 〉    통과 (352.28ms, 36.2MB)
//테스트 6 〉    통과 (345.06ms, 36.4MB)
//테스트 7 〉    통과 (340.22ms, 36.4MB)
//테스트 8 〉    통과 (350.70ms, 40.3MB)
func removePair(_ s: String) -> Int {
    var chars = Array(s)
    var stack = [Character]()

    while chars.count > 0 {
        let code = chars.popLast()!
        if stack.count == 0 || stack.last! != code {
            stack.append(code)
        } else {
            _ = stack.popLast()
        }
    }

    return stack.count == 0 ? 1 : 0
}

// MARK5 - ascii UInt8 Array
//정확성  테스트
//테스트 1 〉    통과 (0.05ms, 16.3MB)
//테스트 2 〉    통과 (34.48ms, 16.4MB)
//테스트 3 〉    통과 (40.01ms, 16.7MB)
//테스트 4 〉    통과 (39.94ms, 16.9MB)
//테스트 5 〉    통과 (47.36ms, 16.8MB)
//테스트 6 〉    통과 (40.03ms, 16.9MB)
//테스트 7 〉    통과 (44.49ms, 16.7MB)
//테스트 8 〉    통과 (45.73ms, 16.9MB)
//테스트 9 〉    통과 (0.04ms, 16.3MB)
//테스트 10 〉    통과 (0.09ms, 16.4MB)
//테스트 11 〉    통과 (0.06ms, 16.1MB)
//테스트 12 〉    통과 (0.04ms, 16.3MB)
//테스트 13 〉    통과 (0.05ms, 16.2MB)
//효율성  테스트
//테스트 1 〉    통과 (435.61ms, 32.1MB)
//테스트 2 〉    통과 (355.28ms, 32MB)
//테스트 3 〉    통과 (430.99ms, 32.1MB)
//테스트 4 〉    통과 (424.15ms, 32MB)
//테스트 5 〉    통과 (423.29ms, 31.9MB)
//테스트 6 〉    통과 (426.04ms, 32MB)
//테스트 7 〉    통과 (419.69ms, 31.7MB)
//테스트 8 〉    통과 (417.68ms, 32MB)
//func removePair(_ s: String) -> Int {
//    var asciiList = Array(s).map { $0.asciiValue! }
//    var stack = [UInt8]()
//
//    while asciiList.count > 0 {
//        let code = asciiList.popLast()!
//        if stack.count == 0 || stack.last! != code {
//            stack.append(code)
//        } else {
//            _ = stack.popLast()
//        }
//    }
//
//
//    return stack.count == 0 ? 1 : 0
//}

// MARK5 - ascii Array
//채점을 시작합니다.
//정확성  테스트
//테스트 1 〉    통과 (0.05ms, 16.3MB)
//테스트 2 〉    통과 (40.98ms, 17.5MB)
//테스트 3 〉    통과 (46.23ms, 17.5MB)
//테스트 4 〉    통과 (45.40ms, 17.4MB)
//테스트 5 〉    통과 (48.35ms, 17.7MB)
//테스트 6 〉    통과 (44.55ms, 17.6MB)
//테스트 7 〉    통과 (44.68ms, 17.5MB)
//테스트 8 〉    통과 (44.74ms, 17.6MB)
//테스트 9 〉    통과 (0.04ms, 16.2MB)
//테스트 10 〉    통과 (0.13ms, 16.5MB)
//테스트 11 〉    통과 (0.04ms, 16.4MB)
//테스트 12 〉    통과 (0.05ms, 16.3MB)
//테스트 13 〉    통과 (0.05ms, 16.3MB)
//효율성  테스트
//테스트 1 〉    통과 (456.70ms, 39MB)
//테스트 2 〉    통과 (406.42ms, 39MB)
//테스트 3 〉    통과 (460.79ms, 38.7MB)
//테스트 4 〉    통과 (472.10ms, 39.1MB)
//테스트 5 〉    통과 (457.68ms, 38.9MB)
//테스트 6 〉    통과 (467.51ms, 38.9MB)
//테스트 7 〉    통과 (483.75ms, 38.7MB)
//테스트 8 〉    통과 (469.17ms, 39.1MB)
//func removePair(_ s: String) -> Int {
//    var asciiList = Array(s).map { Int($0.asciiValue!) }
//    var stack = [Int]()
//
//    while asciiList.count > 0 {
//        let code = asciiList.popLast()!
//        if stack.count == 0 || stack.last! != code {
//            stack.append(code)
//        } else {
//            _ = stack.popLast()
//        }
//    }
//
//
//    return stack.count == 0 ? 1 : 0
//}

// MARK4
//func removePair(_ s: String) -> Int {
//    var s = s
//
//    var table = [String]()
//
//
//    for i in 97 ... 122 {
//        table.append("\(Character(UnicodeScalar(UInt8(i))))\(Character(UnicodeScalar(UInt8(i))))")
//    }
//
//    var changed = true
//    while changed {
//        changed = false
//        var newString = s
//
//        for replacing in table {
//            newString = newString.replacingOccurrences(of: replacing, with: "")
//        }
//
//        if newString.count != s.count {
//            changed = true
//            s = newString
//        }
//    }
//
//    return s.count == 0 ? 1 : 0
//}

// MARK3
//func removePair(_ s: String) -> Int {
//    var asciiList = Array(s).map { Int($0.asciiValue!) }
//
//    var changed = true
//
//    while changed {
//        var i = 0
//        changed = false
//        while i < asciiList.count - 1 {
//            if asciiList[i] == asciiList[i + 1] {
//                changed = true
//                asciiList.remove(at: i)
//                asciiList.remove(at: i)
//            }
//            i += 1
//        }
//    }
//
//    return asciiList.count == 0 ? 1: 0
//}

// MARK2
//func removePair(_ s:String) -> Int {
//    var asciiList = Array(s).map { Int($0.asciiValue!) }
//
//    var i = 0
//    while i < asciiList.count - 1 {
//        while i >= 0 && i < asciiList.count - 1 && asciiList[i] == asciiList[i+1] {
//            asciiList.remove(at: i)
//            asciiList.remove(at: i)
//            i -= 1
//        }
//        while i > 0 && i < asciiList.count && asciiList[i] == asciiList[i - 1] {
//            asciiList.remove(at: i - 1)
//            asciiList.remove(at: i - 1)
//            i -= 1
//        }
//
//        i += 1
//    }
//
//    var str = ""
//    for ascii in asciiList {
//        str = "\(str)\(Character(UnicodeScalar(UInt8(ascii))))"
//    }
//
//    print(str)
//
//    return asciiList.count == 0 ? 1 : 0
//}

// MARK1
//func overlapCheck( _ list: inout [Int]) -> Bool {
//    if list.count < 2 { return false }
//    for i in 0 ..< list.count - 1 {
//        if list[i] == list[i + 1] {
//            list.remove(at: i)
//            list.remove(at: i)
//            return true
//        }
//    }
//
//    return false
//}
//
//func removePair(_ s:String) -> Int {
//    var asciiList = Array(s).map { Int($0.asciiValue!) }
//
//    while overlapCheck(&asciiList) {}
//
//    return asciiList.count == 0 ? 1 : 0
//}
