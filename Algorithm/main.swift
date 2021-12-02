import Foundation

func processTime(_ text: String = "", closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("\(text) 경과 시간: \(processTime)")
}


print(gameSkillTree("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
