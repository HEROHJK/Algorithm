import Foundation

func processTime(_ text: String = "", closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    let result = closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("\(text) 경과 시간: \(processTime)\n=====\n")
}

//print(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2, 3, 4]))
//print(solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2, 3, 5]))
//print(solution(["XYZ", "XWY", "WXA"], [2, 3, 4]))

// ABCDEXYZ
//print(solution([3, 30, 34, 5, 9]))
//print(solution([6, 10, 2]))

//print(name("JAZ"))
//print(name("JEROEN"))
//print(name("JAN")
//print(triangleSnail(1000))

//print(twoAdd([2,1,3,4,1]))

//
//processTime("전부 없는 케이스") {
//    print(sweat(5, [1, 2, 3, 4, 5], []))
//}
//
//processTime("전부 있는 케이스") {
//    print(sweat(5, [], []))
//}
//
//processTime("전부 여분이 있는 케이스") {
//    print(sweat(5, [], [1, 2, 3, 4, 5]))
//}
//
//processTime("0 0 2 1 0") {
//    print(sweat(5, [1, 2, 5], [3]))
//}
//
//processTime("0 0 2 0 1") {
//    print(sweat(5, [1, 2, 4], [3]))
//}
//
//processTime("0 1 0 2 0") {
//    print(sweat(5, [1, 3, 5], [4]))
//}

//processTime {
//    print(example([1, 2, 3, 4, 5]))
//}
//
//processTime {
//    print(example([1, 3, 2, 4, 2]))
//}
//
//processTime {
//    print(example([3, 3, 2, 1, 5]))
//}

//processTime {
//    print(numberK([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]])) // [5, 6, 3]
//}

//processTime {
//    print(removePair("baabaa"))
//}
//
//processTime {
//    print(removePair("cdcd"))
//}
//
//processTime {
//    print(removePair("dcdzzdcd"))
//}

//processTime {
//    print(borderRotation(6, 6, [[2, 2, 5, 4], [3, 3, 6, 6], [5, 1, 6, 3]])) // [8, 10, 25]
//}
//
//processTime {
//    print(borderRotation(3, 3, [[1,1,2,2],[1,2,2,3],[2,1,3,2],[2,2,3,3]])) // [1, 1, 5, 3]
//}
//
//processTime {
//    print(borderRotation(100, 97, [[1,1,100,97]]    )) // [1]
//}
//
//processTime {
//    print(borderRotation(6, 5, [[1,1,6,5]])) // [1]
//}
