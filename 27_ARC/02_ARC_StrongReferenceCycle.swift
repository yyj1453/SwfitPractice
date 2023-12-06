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

var youngjin: Person? = Person(name: "youngjin") // Person 인스턴스의 참조 횟수: 1
var room: Room? = Room(number: "106") // Room 인스턴스의 참조 횟수: 1

room?.host = youngjin // Person 인스턴스의 참조 횟수: 2
youngjin?.room = room // Room 인스턴스의 참조 횟수: 2

youngjin = nil // Person 인스턴스의 참조 횟수: 1
room = nil // Room 인스턴스의 참조 횟수: 1

// Person 인스턴스를 참조할 방법 상실 - 메모리에 잔존
// Room 인스턴스를 참조할 방법 상실 - 메모리에 잔존