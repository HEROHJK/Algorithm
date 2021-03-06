// https://book.naver.com/bookdb/book_detail.nhn?bid=16439154
// https://github.com/ndb796/python-for-coding-test

import Foundation

func implement1(size: Int, wayString: String) -> String {
    var x = 0
    var y = 0
    for way in wayString.split(separator: " ") {
        switch way {
        case "L" where y > 0: y -= 1
        case "R" where y < size: y += 1
        case "U" where x > 0: x -= 1
        case "D" where x < size: x += 1
        default: break
        }
    }
    
    return "\(x + 1) \(y + 1)"
}

func implement2(number: Int) -> Int {
    let timeLength = 3600 * (number + 1)
    
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .positional
    
    var count = 0
    
    for time in 0 ..< timeLength {
        count += formatter.string(from: TimeInterval(time))!.contains("\(number)") ? 1 : 0
    }
    
    return count
}

func implement2_1(number: Int) -> Int {
    var count = 0
    for hour in 0 ... number {
        for minute in 0 ..< 60 {
            for second in 0 ..< 60 {
                if hour / 10 == number || hour % 10 == number || hour == number ||
                    minute / 10 == number || minute % 10 == number || minute == number ||
                    second / 10 == number || second % 10 == number || second == number
                {
                    count += 1
                }
            }
        }
    }
    
    return count
}

func implement2_2(number: Int) -> Int {
    var count = 0
    
    for hour in 0 ... number {
        if hour / 10 == number || hour % 10 == number || hour == number {
            count += 3600
            continue
        }
        for minute in 0 ..< 60 {
            if minute / 10 == number || minute % 10 == number || minute == number {
                count += 60
                continue
            }
            for second in 0 ..< 60 {
                if second / 10 == number || second % 10 == number || minute == number {
                    count += 1
                }
            }
        }
    }
    
    return count
}

func implement2_3(number: Int) -> Int {
    var count = 0
    for h in 0 ... number {
        for m in 0 ..< 60 {
            for s in 0 ..< 60 {
                if String(format:"%02i:%02i:%02i", h, m, s).contains("\(number)") { count += 1 }
            }
        }
    }
    
    return count
}

func implement3(_ startPoint: String) -> Int {
    var count = 8
    let startPointCharArray = Array(startPoint) // ???????????? ???????????? ?????? ???????????? ??????.
    var points = [Int]()
    
    let max = 7
    
    for point in startPointCharArray {
        // x??? y??? ????????? ???????????????, x, y??? ????????? ???????????? ??????. ????????? 2?????? ????????? ??????.
        // 1~8 / A~H ??? ???????????? ???????????????, ????????? ?????? ?????? ?????? 0~7??? ??????.
        // ?????? ???????????? ???????????? ?????? ??? ???????????? ????????? ??????, ???????????? ????????? ??????.
        // ????????? ????????? a??? ????????????????????? 97?????????, 97??? ?????????. ????????? a??? 0, h??? 7??????.
        points.append(
            point.isWholeNumber ? Int(point.wholeNumberValue!) - 1 : Int(point.asciiValue!) - 97
        )
    }
    
    // ?????? ????????? ????????? ?????????.
    // "2??? ?????? ??? ?????? ??????."
    // 2??? ????????? ?????? ????????????, ??????????????? ?????? ?????????. ????????? ???, ??? 1?????? ??????????????? ????????? ?????????, 2??? ????????? ?????? ???????????? 2?????? ??????????????? ????????????.
    // 2???????????? ?????????, ?????? ?????? ???????????? ????????? ?????? ???????????? 1?????? ??????????????? ????????????.
    // 4?????????????????????, ?????? ??????????????? 8?????????. ????????? count??? 8?????? ????????? ???????????? ?????? ???.
    // ?????? ?????????, ????????? ?????? ????????? ??????????????? ??????????????????.
    // if x - 2 < 0 { count -= 2 }
    // if x + 2 > 7 { count -= 2 }
    // if x - 1 < 0 { count -= 1 }
    // if x + 1 > 7 { count -= 1 }
    // if y - 2 < 0 { count -= 2 }
    // .
    // .
    // .
    // if y + 1 > 7 { count -= 1 }
    // ??? ????????? x, y??? ?????? 2?????? ????????????, ????????? ??????????????? ???????????? ?????? ????????? ????????????.
    for point in points {
        for value in 1 ... 2 where point - value < 0 || point + value > max {
            count -= value
        }
    }
    
    return count
}

func implement3_1(_ startPoint: String) -> Int {
    var count = 8
    let startPointCharArray = Array(startPoint) // ???????????? ???????????? ?????? ???????????? ??????.
    var points = [Int]()
    
    let max = 7
    
    for point in startPointCharArray {
        points.append(
            point.isWholeNumber ? Int(point.wholeNumberValue!) - 1 : Int(point.asciiValue!) - 97
        )
    }
    
    for point in points {
        for value in 1 ... 2 where point - value < 0 || point + value > max {
            count -= value
        }
    }
    
    return count
}

class CharacterPoint {
    enum Cardinal: Int {
        case n = 0
        case e = 1
        case s = 2
        case w = 3
    }
    
    
    var x = 0
    var y = 0
    var direction = Cardinal.n
    
    init(_ startPoint: String) {
        self.x = Int(startPoint.split(separator: " ")[0])!
        self.y = Int(startPoint.split(separator: " ")[1])!
        self.direction = Cardinal(rawValue: Int(startPoint.split(separator: " ")[2])!)!
    }
    
    func turn() -> Cardinal {
        var value = self.direction.rawValue
        value = value == 0 ? 3 : value - 1
        self.direction = Cardinal(rawValue: value)!
        
        return self.direction
    }
}

func stringsToMap(_ points: [String]) -> [[Int]] {
    var map = [[Int]]()
    
    for point in points {
        var row = [Int]()
        point.split(separator: " ").forEach { row.append(Int($0)!) }
        map.append(row)
    }
    
    return map
}



func implement4(_ size: String, _ startPoint: String, _ points: String...) -> Int {
    var count = 1
    
    let maxX = Int(size.split(separator: " ")[0])!
    let maxY = Int(size.split(separator: " ")[0])!
    
    let point = CharacterPoint(startPoint)
    
    var map = stringsToMap(points)
    
    var directionCount = 0
    
    var target = (0, 0)
    
    while true {
        _ = point.turn()
        directionCount += 1
        target = (point.y, point.x)
        switch point.direction {
        case .n: target.0 -= 1
        case .e: target.1 += 1
        case .s: target.0 += 1
        case .w: target.1 -= 1
        }
        if target.1 >= 0, target.1 < maxX,
           target.0 >= 0, target.0 < maxY {
            if map[target.0][target.1] == 0 {
                map[target.0][target.1] = 2 // ??????????????? 2??? ??????
                map[point.y][point.x] = 2 // ?????? ??????, ????????? ????????? ?????? ??? ??? 2??? ??????
                point.y = target.0
                point.x = target.1
                count += 1
                directionCount = 0
                continue
            }
        }
        
        if directionCount > 3 { // 4??? ??? ????????????
            target = (point.y, point.x)
            switch point.direction { // ?????? ???????????? ?????? ?????? ????????? ????????? ??????
            case .n: target.0 += 1
            case .e: target.1 -= 1
            case .s: target.0 -= 1
            case .w: target.1 += 1
            }
            
            if target.1 > 0, target.1 < maxX,
               target.0 > 0, target.0 < maxY {
                if map[target.0][target.1] == 1{ // ????????? ??????
                    break
                } else { // ????????????????????? ?????? ????????? ??????
                    point.y = target.0
                    point.x = target.1
                    directionCount = 0
                }
            }
        }
    }
    
    return count
}
