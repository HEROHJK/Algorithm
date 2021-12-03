import Foundation

// MARK: - 프린터
// https://programmers.co.kr/learn/courses/30/lessons/42587
// MARK: -

func printer(_ priorities:[Int], _ location:Int) -> Int {
    var jobs = [(Int, Int)]()
    var count = 0

    for i in 0 ..< priorities.count {
        jobs.append((i, priorities[i]))
    }


    while jobs.count > 0 {
        var containsCount = 0
        let selectJob = jobs.remove(at: 0)
        for job in jobs {
            if job.1 > selectJob.1 {
               containsCount += 1
                break
            }
        }
        if containsCount == 0 {
            count += 1
            if location == selectJob.0 { break }
        } else {
            jobs.append(selectJob)
        }

    }

    return count
}

// MARK: TestCase
//print(printer([2, 1, 3, 2], 2))
//print(printer([1, 1, 9, 1, 1, 1] , 0))
