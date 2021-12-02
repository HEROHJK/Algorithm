import Foundation

// MARK: - 가장 큰 정사각형
// https://programmers.co.kr/learn/courses/30/lessons/12905
func maxSquare(_ board:[[Int]]) -> Int {
    var maxSize = 0
    var board = board
    
    for i in 0 ..< board.count {
        for j in 0 ..< board[i].count {
            if i > 0, j > 0 {
                let left = board[i][j - 1]
                let topLeft = board[i - 1][j - 1]
                let top = board[i - 1][j]
                if board[i][j] > 0 {
                    board[i][j] = min(left, topLeft, top) + 1
                }
            }
            
            if maxSize < board[i][j] { maxSize = board[i][j] }
        }
    }
    
    return maxSize * maxSize
}
