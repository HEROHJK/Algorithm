//
//  Stack.swift
//  Algorithm
//
//  Created by 오디언 on 2021/11/30.
//

import Foundation


// 괄호 회전하기
// https://programmers.co.kr/learn/courses/30/lessons/76502
func turnParen(_ s:String) -> Int {
    var count = 0
    
    var sArray = Array(s)
    var stack: [Character]
    
    if !pairCheck(sArray) { return 0 } // 짝이 안맞으면 카운트가 될수가 없으므로 0 반환.
    
    for _ in 0 ..< s.count {
        stack = [Character]()
        
        for c in sArray {
            if !stack.isEmpty && closeParen(stack.last!) == c {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        
        if stack.isEmpty { count += 1 }
        
        sArray.append(sArray[0])
        sArray.remove(at: 0)
    }
    
    return count
}


func closeParen(_ c: Character) -> Character {
    return c == "(" ? ")" : c == "{" ? "}" : c == "[" ? "]" : " "
}

func pairCheck(_ str: [Character]) -> Bool {
    var bigLParen = 0
    var bigRParen = 0
    var middleLParen = 0
    var middleRParen = 0
    var smallLParen = 0
    var smallRParen = 0
    str.forEach {
        switch $0 {
        case "[": bigLParen += 1
        case "]": bigRParen += 1
        case "{": middleLParen += 1
        case "}": middleRParen += 1
        case "(": smallLParen += 1
        case ")": smallRParen += 1
        default: break
        }
    }
    
    if bigLParen != bigRParen ||
        middleLParen != middleRParen ||
        smallLParen != smallRParen {
        return false
    }
    
    return true
}
