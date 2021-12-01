import Foundation

func bfs() {
    let graph = [
        [2, 3, 8],
        [1, 7],
        [1, 4, 5],
        [3, 5],
        [3, 4],
        [7],
        [2, 6, 8],
        [1, 7]
    ]
    
    var queue = [Int]()
    var visit = [Int]()
    visit.append(1)
    
    for i in 0 ..< graph.count {
        queue.append(i)
        
    }
    
    for node in graph {
        for i in node {
            if !queue.contains(i) { queue.append(i) }
        }
    }
    
    print(queue)
}

func dfs() {
    let graph = [
        [2, 3, 8],
        [1, 7],
        [1, 4, 5],
        [3, 5],
        [3, 4],
        [7],
        [2, 6, 8],
        [1, 7]
    ]
    
    let result = dfs_search(graph, 0, [Int]())
    
    print(result)
}

func dfs_search(_ graph: [[Int]], _ current: Int, _ queue: [Int]) -> [Int] {
    var queue = queue
    if !queue.contains(current + 1) { queue.append(current + 1) }
    for i in graph[current] {
        if !queue.contains(i) {
            queue = dfs_search(graph, i - 1, queue)
        }
    }
    
    return queue
}
