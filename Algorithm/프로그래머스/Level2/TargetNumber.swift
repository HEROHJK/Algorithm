import Foundation

// MARK: - 타겟 넘버
// https://programmers.co.kr/learn/courses/30/lessons/43165
var results = [Int]()

func targetNumber(_ numbers: [Int], _ target: Int) -> Int {
    targetNumber_dfs(numbers, 0, 1)
    return (results.filter { $0 == target }).count
}

func targetNumber_dfs(_ numbers: [Int], _ value: Int, _ depth: Int) {
    if depth == numbers.count {
        results.append(value + numbers[depth - 1])
        results.append(value - numbers[depth - 1])
    } else {
        targetNumber_dfs(numbers, value + numbers[depth - 1], depth + 1)
        targetNumber_dfs(numbers, value - numbers[depth - 1], depth + 1)
    }
}

// MARK: TestCase
// print(targetNumber([1, 1, 1, 1, 1], 3))
