import Foundation

func processTime(_ text: String = "", closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("\(text) 경과 시간: \(processTime)")
}

print(square([[0,0,1,1],[1,1,1,1]]))
//print(square([
//[1,1,1,1,0,0,0,1,1,1],
//[1,1,1,1,0,1,1,1,1,1],
//[1,1,1,1,1,1,1,1,1,1],
//[0,0,1,1,1,1,1,1,1,1],
//[0,0,0,0,1,1,1,1,1,1]
//]))

//print(square([
//[1, 0, 0],
//[1, 0, 0],
//[1, 0, 0],
//]))
