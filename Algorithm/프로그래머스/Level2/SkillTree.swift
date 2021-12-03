import Foundation

// MARK: - 스킬트리
// https://programmers.co.kr/learn/courses/30/lessons/49993
// MARK: -

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
