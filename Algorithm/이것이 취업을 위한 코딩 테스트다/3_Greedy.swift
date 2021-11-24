// https://book.naver.com/bookdb/book_detail.nhn?bid=16439154
// https://github.com/ndb796/python-for-coding-test

import Foundation

func greedy1(price: Int) {
    let coinTable = [500, 100, 50, 10]
    
    var resultText = ""
    
    var price = price
    
    for coin in coinTable {
        let count = price/coin
        
        resultText += "\(coin)원 \(count)개\n"
        
        price %= coin
    }
    
    print(resultText)
}


// greedy1(price: 1260)

func greedy2_1(input: String, numberString: String) {
    let split = input.components(separatedBy: " ")
    guard split.count > 2 else { return }
    guard var count = Int(split[1]) else { fatalError("count의 유형이 올바르지 않습니다.") }
    guard let consecutive = Int(split[2]) else { fatalError("consecutive의 유형이 올바르지 않습니다.") }

    let numbers: [Int] = numberString.split(separator: " ").compactMap{ Int($0) }.sorted(by: >)
    
    var result = 0
    var i = 0
    
    while count > 0 {
        result += numbers[0]
        count -= 1
        i += 1
        
        if consecutive <= i {
            result += numbers[1]
            count -= 1
            i = 0
        }
    }
    
    print(result)
}

func greedy2_2(input: String, numberString: String) {
    let split = input.components(separatedBy: " ")
    guard split.count > 2 else { return }
    guard let count = Int(split[1]) else { fatalError("count의 유형이 올바르지 않습니다.") }
    guard let consecutive = Int(split[2]) else { fatalError("consecutive의 유형이 올바르지 않습니다.") }

    let numbers: [Int] = numberString.split(separator: " ").compactMap{ Int($0) }.sorted(by: >)
    
    let firstNumber = numbers[0]
    let secondNumber = numbers[1]
    
    let sum = firstNumber * consecutive + secondNumber // 가장큰수의 연속값 + 가장 작은수의 합
    
    /*
     위에서 계산한 합을 더해준 후,
     나머지 횟수만큼 가장 큰수를 더해준다.
     */
    
    let result = (sum * (count / (consecutive + 1))) + ((count % (consecutive + 1)) * firstNumber)
    
    print(result)
}

// greedy2_1(input: "5 8 3", numberString: "2 4 5 4 6")
// greedy2_2(input: "5 8 3", numberString: "2 4 5 4 6")

func greedy3(inputSize: String, cardsString: String...) {
    var numbers: [Int] = [0]
    cardsString.forEach { numbers.append($0.split(separator: " ").compactMap { Int($0) }.sorted()[0]) }
    print(numbers.sorted(by: >)[0])
}

// greedy3(inputSize: "2 4", cardsString: "7 3 1 8", "3 3 3 4")

func greedy4(_ n: Int, _ k: Int) -> Int {
    var n = n
    
    var count = 0
    
    while n >= k {
        if n % k != 0 {
            count += n % k
            n -= n % k
        }
        if n / k > 0 {
            count += 1
            n /= k
        }
    }
    
    count += n - 1
    
    return count
}

// print(greedy4(25, 3))
