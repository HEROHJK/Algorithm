// 코딜리티 레슨1

// MARK: - 바이너리 갭
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
