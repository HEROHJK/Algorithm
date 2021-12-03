import Foundation

// MARK: - 다음 큰 숫자
// https://programmers.co.kr/learn/courses/30/lessons/12911
func nextBigNumber(_ n:Int) -> Int {
    var answer = n + 1
    
    let nCount1 = String(n, radix: 2).characterCount(at: "1")
    
    
    while String(answer, radix: 2).characterCount(at: "1") != nCount1 {
        answer += 1
    }
    
    return answer
}

extension String {
    func characterCount(at: Character) -> Int {
        var count = 0
        for ch in self where ch == at {
            count += 1
        }
        
        return count
    }
}

// MARK: TestCase
// print(nextBigNumber(78))
// print(nextBigNumber(15))
