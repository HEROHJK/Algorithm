// 코딜리티 레슨 - https://app.codility.com/programmers/lessons

// MARK: - Lesson 1. 바이너리 갭
// https://app.codility.com/programmers/lessons/1-iterations/
// MARK: -

import Foundation

func binaryInterval(_ N: Int) -> Int{
    var max = 0
    let binary = Array(String(N, radix: 2))
    var count = 0
    
    for i in 1 ..< binary.count {
        if binary[i] == "1" {
            if max < count {
                max = count
            }
            count = 0
        } else {
            count += 1
        }
    }
    
    return max
}

// MARK: - Lesson 2. 순환 회전
// https://app.codility.com/programmers/lessons/2-arrays/
// MARK: -
func cyclicRotation(_ A: inout [Int], _ K: Int) -> [Int] {
    guard A.count > 0 else { return A }
    let K = K % A.count
    
    for _ in 0 ..< K {
        A.insert(A[A.count - 1], at: 0)
        A.remove(at: A.count - 1)
    }
    
    return A
}
