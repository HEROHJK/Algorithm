import Foundation

// MARK: - [1차] 뉴스 클러스터링
// https://programmers.co.kr/learn/courses/30/lessons/17677
// MARK: -

func jacquardPattern(_ str1:String, _ str2:String) -> Int {
    let str1Array = Array(str1.lowercased())
    let str2Array = Array(str2.lowercased())
    
    var str1Set = Set<String>()
    var str2Set = Set<String>()
    
    for i in 0 ..< str1Array.count - 1 {
        if str1Array[i].isLetter, str1Array[i+1].isLetter {
            var j = 0
            while true {
                let item = "\(j)\(str1Array[i])\(str1Array[i+1])"
                if !str1Set.contains(item) {
                    str1Set.insert(item)
                    break
                }
                j += 1
            }
        }
    }
    
    for i in 0 ..< str2Array.count - 1 {
        if str2Array[i].isLetter, str2Array[i+1].isLetter {
            var j = 0
            while true {
                let item = "\(j)\(str2Array[i])\(str2Array[i+1])"
                if !str2Set.contains(item) {
                    str2Set.insert(item)
                    break
                }
                j += 1
            }
        }
    }
    
    let intersection = str1Set.intersection(str2Set)
    let union = str1Set.union(str2Set)
    
    if union.count <= 0 { return 65536 }
    
    let result = Int(Float(intersection.count) / Float(union.count) * 65536.0)
    return result
}

// MARK: TestCase
//print(jacquardPattern("FRANCE", "FRENCH"))
//print(jacquardPattern("handshake", "shake hands"))
//print(jacquardPattern("aa1+aa2", "aaaa12"))
//print(jacquardPattern("e=m*c^2", "e=m*c^2"))
