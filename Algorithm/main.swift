import Foundation

func processTime(_ text: String = "", closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("\(text) 경과 시간: \(processTime)")
}

//print(implement1(size: 5, wayString: "R R R U D D"))

processTime("implement2") { print(implement2(number: 5)) }
processTime("implement2_1") { print(implement2_1(number: 5)) }
processTime("implement2_2") { print(implement2_2(number: 5)) }
processTime("implement2_3") { print(implement2_3(number: 5)) }
