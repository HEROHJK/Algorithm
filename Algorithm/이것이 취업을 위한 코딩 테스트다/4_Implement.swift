// https://book.naver.com/bookdb/book_detail.nhn?bid=16439154
// https://github.com/ndb796/python-for-coding-test

import Foundation

func implement1(size: Int, wayString: String) -> String {
    var x = 0
    var y = 0
    for way in wayString.split(separator: " ") {
        switch way {
        case "L":
            if y > 0 { y -= 1 }
        case "R":
            if y < size { y += 1 }
        case "U":
            if x > 0 { x -= 1 }
        case "D":
            if x < size { x += 1 }
        default: fatalError("way Error")
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
