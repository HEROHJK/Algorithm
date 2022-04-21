import Foundation

// MARK: - 체육복
// https://programmers.co.kr/learn/courses/30/lessons/42862
// MARK: -

/// MARK3
/// C언어 스타일..?
func sweat(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    var sweats = [Int](repeating: 1, count: n)
    
    lost.forEach { sweats[$0 - 1] -= 1 }
    reserve.forEach { sweats[$0 - 1] += 1 }
    
    var i = 0
    while i < sweats.count - 1 {
        if sweats[i] == 0 {
            if i > 0, sweats[i - 1] == 2 {
                sweats[i] += 1
                sweats[i - 1] -= 1
                i += 2
                continue
            } else if sweats[i + 1] == 2 {
                sweats[i] += 1
                sweats[i + 1] -= 1
                i += 2
                continue
            }
        }
        i += 1
    }

    return sweats.filter { $0 > 0 }.count
}

/// MARK2
//func sweat(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
//    var newReserve = reserve.filter { !lost.contains($0) }.sorted()
//    let newLost = lost.filter { !reserve.contains($0) }.sorted()
//    var result = n - newLost.count
//
//    for i in 0 ..< newLost.count {
//        if newLost[i] > 1, let removeIndex = newReserve.indices.filter({ newReserve[$0] == newLost[i] - 1 }).first {
//            newReserve.remove(at: removeIndex)
//            result += 1
//        } else if newLost[i] < n, let removeIndex = newReserve.indices.filter({ newReserve[$0] == newLost[i] + 1 }).first {
//            newReserve.remove(at: removeIndex)
//            result += 1
//        }
//    }
//
//    return result
//}

/// MARK1
//func sweat(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
//    var result = n - lost.count
//    var reserve = reserve.sorted()
//    var lost = lost.sorted()
//
//    var i = 0
//    while i < lost.count {
//        if let removeIndex = reserve.indices.filter({ reserve[$0] == lost[i] }).first {
//            reserve.remove(at: removeIndex)
//            result += 1
//            lost.remove(at: i)
//        } else { i += 1 }
//    }
//
//    for i in 0 ..< lost.count {
//        if lost[i] > 1, let removeIndex = reserve.indices.filter({ reserve[$0] == lost[i] - 1 }).first {
//            reserve.remove(at: removeIndex)
//            result += 1
//        } else if lost[i] < n, let removeIndex = reserve.indices.filter({ reserve[$0] == lost[i] + 1 }).first {
//            reserve.remove(at: removeIndex)
//            result += 1
//        }
//    }
//
//    return result
//}
