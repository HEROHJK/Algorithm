import Foundation

// MARK: - 삼각 달팽이
// https://programmers.co.kr/learn/courses/30/lessons/68645
// MARK: -

func triangleSnail(_ n:Int) -> [Int] {
    var snailList = [[Int]]()

    var max = 0
    var direction: Direction = .down
    var i = 0
    var j = 0

    for i in 1 ... n {
        snailList.append([Int](repeating: 0, count: i))
        max += i
    }

    for number in 1 ... max {
        snailList[i][j] = number
        switch direction {
        case .right:
            if j + 1 >= snailList[i].count || ( j + 1 < snailList[i].count && snailList[i][j+1] != 0 ) {
                direction = .up
                i -= 1
                j -= 1
            } else { j += 1 }
        case .up:
            if i - 1 < 0 || ( i - 1 >= 0 && snailList[i - 1][j - 1] != 0 ) {
                direction = .down
                i += 1
            } else {
                i -= 1
                j -= 1
            }
        case .down:
            if i + 1 >= snailList.count || (i + 1 < snailList.count && snailList[i + 1][j] != 0) {
                direction = .right
                j += 1
            } else { i += 1 }
        }


    }

    var numbers = [Int]()
    snailList.forEach { numbers += $0 }

    return numbers
}


enum Direction {
    case right
    case up
    case down
}


// MARK: - TestCase
// print(triangleSnail(1000))
