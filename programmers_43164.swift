import Foundation

var result = [String]()
func dfs(_ tickets: [[String]], _ travels: [String], _ count: Int) {
    if travels.count == count + 1 {
        if result.count == 0 {
            result = travels
        } else {
            for i in 0..<travels.count {
                if travels[i] < result[i] {
                    result = travels
                    return
                } else if travels[i] > result[i] { return }
            }
        }
    } else {
        for (index, ticket) in tickets.enumerated() {
            if ticket[0] == travels.last! {
                var tickets = tickets
                tickets.remove(at: index)
                var travels = travels
                travels.append(ticket[1])
                dfs(tickets, travels, count)
            }
        }
    }
}

func solution(_ tickets:[[String]]) -> [String] {
    
    result = [String]()
    dfs(tickets, ["ICN"], tickets.count)
    return result
}