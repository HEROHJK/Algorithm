import Foundation

func processTime(_ text: String = "", closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("\(text) 경과 시간: \(processTime)")
}


//print(gameSkillTree("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))

print(thatSong("ABCDEFG", ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]))
