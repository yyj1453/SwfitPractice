class Person {
    let name: String

    init(name: String) {
        self.name = name
    }

    var room: Room?

    deinit {
        print("\(name) is being deinitialized")
    }
}

class Room {
    let number: String

    init(number: String) {
        self.number = number
    }

    var host: Person?

    deinit {
        print("Room \(number) is being deinitialized")
    }
}

var youngjin: Person? = Person(name: "youngjin") // Person 참조 횟수: 1
var room: Room? = Room(number: "106") // Room 참조 횟수: 1

room?.host = youngjin // Person 참조 횟수: 2
youngjin?.room = room // Room 참조 횟수: 2

youngjin?.room = nil // Room 참조 횟수: 1
youngjin = nil // Person 참조 횟수: 1

room?.host = nil // Person 참조 횟수: 0
room = nil // Room 참조 횟수: 0