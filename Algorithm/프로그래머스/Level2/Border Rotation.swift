import Foundation

// MARK: - 행렬 테두리 회전하기
// https://programmers.co.kr/learn/courses/30/lessons/77485
// MARK: -

// 행렬의 좌표계는 디스플레이의 좌표계와 반대
// x는 수직 y는 수평
// 디스플레이는 x가 수평 y가 수직
func borderRotation(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var square = [[Int]]()
    
    var result = [Int]()
    
    var number = 1
    for _ in 0 ..< rows {
        var line = [Int]()
        for _ in 0 ..< columns {
            line.append(number)
            number += 1
        }
        square.append(line)
    }
    
    for query in queries {
        let minX = query[0] - 1
        let minY = query[1] - 1
        let maxX = query[2] - 1
        let maxY = query[3] - 1
        
        
        var line = [Int]()
        var points = [(Int, Int)]()
        
        var pointX = minX
        var pointY = minY
        
        while pointY < maxY {
            points.append((pointX, pointY))
            line.append(square[pointX][pointY])
            pointY += 1
        }
        
        while pointX < maxX {
            points.append((pointX, pointY))
            line.append(square[pointX][pointY])
            pointX += 1
        }
        
        while pointY > minY {
            points.append((pointX, pointY))
            line.append(square[pointX][pointY])
            pointY -= 1
        }
        

        while pointX > minX {
            points.append((pointX, pointY))
            line.append(square[pointX][pointY])
            pointX -= 1
        }
        
        
        line.insert(line.popLast()!, at: 0)
        var i = 0
        for point in points {
            square[point.0][point.1] = line[i]
            i += 1
        }
        
        result.append(line.min()!)
    }
    
    return result
}
