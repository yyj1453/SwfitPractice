protocol Talkable { }
protocol CallToAll {
    func callToAll()
}

struct Person: Talkable { }
struct Animal { }

// 배열이 CallToAll 프로토콜을 준수하고 배열의 요소들이 Talkable 프로토콜을 준수
extension Array: CallToAll where Element: Talkable {
    func callToAll() { }
}

let people: [Person] = []
let cats: [Animal] = []

people.callToAll()