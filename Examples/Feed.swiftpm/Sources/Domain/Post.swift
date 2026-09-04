import Foundation

struct Post: Identifiable {
    let id: UUID
    let groupName: String
    let text: String
    let authorName: String
}

extension Array<Post> {
    static func mock() -> Self {
        let groups = [
            "Technology",
            "Travel",
            "Photography",
            "Fitness",
            "Food"
        ]
        
        var posts: [Post] = []
        
        for group in groups {
            posts.append(
                contentsOf: Self.mock(groupName: group)
            )
        }
        
        return posts.shuffled()
    }
    
    static func mock(groupName: String) -> Self {
        let authors = [
            "Alice", "Bob", "Charlie", "Diana", "Ethan",
            "Fiona", "George", "Hannah", "Ivan", "Julia"
        ]
        
        return (1...10).map { index in
            Post(
                id: UUID(),
                groupName: groupName,
                text: "Mock post \(index) in \(groupName)",
                authorName: authors[(index - 1) % authors.count]
            )
        }
    }
}
