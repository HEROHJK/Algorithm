import Foundation

// MARK: - 스킬트리
// https://programmers.co.kr/learn/courses/30/lessons/49993
func gameSkillTree(_ skill:String, _ skill_trees:[String]) -> Int {
    var count = 0
    for skillTree in skill_trees {
        var skillOrders = [Int]()
        for ch in skill {
            skillOrders.append(skillTree.firstIndexInt(of: ch))
        }
        
        if skillOrders == skillOrders.sorted() {
            count += 1
        }
    }
    return count
}


extension String {
    func firstIndexInt(of: Character) -> Int {
        if let firstIndex = self.firstIndex(of: of) {
            return Int(firstIndex.utf16Offset(in: self))
        } else { return self.count }
    }
}

// MARK: - 방금 그 곡
// https://programmers.co.kr/learn/courses/30/lessons/17683
func thatSong(_ m:String, _ musicinfos:[String]) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    var result = "(None)"
    var maxLength = 0
    
    let m = sheetToString(m)
    
    for info in musicinfos {
        let infoSplit = info.split(separator: ",")
        let start = formatter.date(from: String(infoSplit[0]))!
        let end = formatter.date(from: String(infoSplit[1]))!
        let length = Int(end.timeIntervalSince(start))/60
        if maxLength < length {
            let sheet = makeFullSong(sheetToString(String(infoSplit[3])), length)
            if sheet.contains(m) {
                result = String(infoSplit[2])
                maxLength = length
            }
        }
    }
    
    return result
}

func sheetToString(_ m: String) -> String {
    var str = ""
    var mArray = Array(m)
    while mArray.count > 0 {
        if mArray[0] == "#" {
            let last = str.removeLast()
            switch last {
            case "C": str += "1"
            case "D": str += "2"
            case "F": str += "3"
            case "G": str += "4"
            case "A": str += "5"
            default : break
            }
        } else {
            str += "\(mArray[0])"
        }
        mArray.remove(at: 0)
    }
    
    return str
}

func makeFullSong(_ m: String, _ musicLength: Int) -> String {
    var str = ""
    
    var idx = 0
    
    let sheetLength = m.count
    
    let mArray = Array(m)
    
    for _ in 0 ..< musicLength {
        str += "\(mArray[idx])"
        idx += 1
        if idx >= sheetLength {
            idx = 0
        }
    }
    
    return str
}
